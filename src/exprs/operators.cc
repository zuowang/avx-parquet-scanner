// Copyright 2012 Cloudera Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "exprs/operators.h"
#include "exprs/literal.h"
#include "exprs/slot-ref.h"

namespace impala{

Operators::Operators(Expr* child0, int v) {
  AddChild(child0);
  AddChild(new Literal(v));
  __m256i shiftmask1 = _mm256_setr_epi32(0, 4, 0 ,4, 0, 4, 0, 4);
  __m256i v32 = _mm256_set1_epi32(v);
  __m256i v9 = _mm256_or_si256(v32, _mm256_slli_epi32(v32, 9));
  v9 = _mm256_or_si256(v9, _mm256_slli_epi32(v32, 18));
  v9 = _mm256_or_si256(v9, _mm256_slli_epi32(v32, 27));
  v9 = _mm256_sllv_epi32(v9, shiftmask1);
  val_ = _mm256_or_si256(v9, _mm256_srli_epi64(v32, 5));
}

Operators::~Operators() { delete GetChild(1); }

EQ::EQ(Expr* child0, int v) : Operators(child0, v) {}

void EQ::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  SlotRef* slot = (SlotRef*)GetChild(0);
  ColumnReader& cr = cols[slot->GetSlotOffset()];
  __m256i T = cr.dec_->Top();

  __m256i D = _mm256_xor_si256(T, val_);
  __m256i tmp = _mm256_and_si256(D, M_);
  tmp = _mm256_add_epi64(tmp, M_);
  __m256i R = _mm256_or_si256(D, tmp);
  flag = _mm256_or_si256(flag, R);
}

NE::NE(Expr* child0, int v) : Operators(child0, v) {}

void NE::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  SlotRef* slot = (SlotRef*)GetChild(0);
  ColumnReader& cr = cols[slot->GetSlotOffset()];
  __m256i T = cr.dec_->Top();

  __m256i D = _mm256_xor_si256(T, val_);
  __m256i tmp = _mm256_and_si256(D, M_);
  tmp = _mm256_add_epi64(tmp, M_);
  __m256i R = _mm256_or_si256(D, tmp);
  __m256i one = _mm256_set1_epi32(0xffffffff);
  R = _mm256_andnot_si256(one, R);
  flag = _mm256_or_si256(flag, R);
}

GT::GT(Expr* child0, int v)
  : Operators(child0, v) {
  all_false_ = v == 0x1ff;
}

void GT::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  if (all_false_) {
    flag = _mm256_and_si256(flag, _mm256_setzero_si256());
    return;
  }
  SlotRef* slot = (SlotRef*)GetChild(0);
  ColumnReader& cr = cols[slot->GetSlotOffset()];
  __m256i T = cr.dec_->Top();

  __m256i C = _mm256_sub_epi64(Max_, val_);
  __m256i t1 = _mm256_or_si256(T, M_);
  __m256i t2 = _mm256_and_si256(val_, NotM_);
  __m256i L = _mm256_sub_epi64(t1, t2);
  t1 = _mm256_and_si256(C, NotM_);
  t2 = _mm256_and_si256(L, NotM_);
  __m256i U = _mm256_sub_epi64(t1, t2);
  t1 = _mm256_xor_si256(L, U);
  t2 = _mm256_xor_si256(val_, C);
  __m256i R = _mm256_xor_si256(t1, t2);
  flag = _mm256_or_si256(flag, R);
}

LT::LT(Expr* child0, int v)
  : Operators(child0, v) {
  all_false_ = v == 0;
}

void LT::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  if (all_false_) {
    flag = _mm256_and_si256(flag, _mm256_setzero_si256());
    return;
  }

  SlotRef* slot = (SlotRef*)GetChild(0);
  ColumnReader& cr = cols[slot->GetSlotOffset()];
  __m256i T = cr.dec_->Top();

  __m256i C = _mm256_sub_epi64(val_, Min_);
  __m256i t1 = _mm256_or_si256(T, M_);
  __m256i t2 = _mm256_and_si256(Min_, NotM_);
  __m256i L = _mm256_sub_epi64(t1, t2);
  t1 = _mm256_and_si256(C, NotM_);
  t2 = _mm256_and_si256(L, NotM_);
  __m256i U = _mm256_sub_epi64(t1, t2);
  t1 = _mm256_xor_si256(L, U);
  t2 = _mm256_xor_si256(Min_, C);
  __m256i R = _mm256_xor_si256(t1, t2);
  flag = _mm256_or_si256(flag, R);
}

GE::GE(Expr* child0, int v)
  : Operators(child0, v == 0 ? v : v - 1) {
  all_true_ = v == 0;
}

void GE::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  if (all_true_) return;

  SlotRef* slot = (SlotRef*)GetChild(0);
  ColumnReader& cr = cols[slot->GetSlotOffset()];
  __m256i T = cr.dec_->Top();

  __m256i C = _mm256_sub_epi64(Max_, val_);
  __m256i t1 = _mm256_or_si256(T, M_);
  __m256i t2 = _mm256_and_si256(val_, NotM_);
  __m256i L = _mm256_sub_epi64(t1, t2);
  t1 = _mm256_and_si256(C, NotM_);
  t2 = _mm256_and_si256(L, NotM_);
  __m256i U = _mm256_sub_epi64(t1, t2);
  t1 = _mm256_xor_si256(L, U);
  t2 = _mm256_xor_si256(val_, C);
  __m256i R = _mm256_xor_si256(t1, t2);
  flag = _mm256_or_si256(flag, R);
}

LE::LE(Expr* child0, int v)
  : Operators(child0, v == 0x1ff ? v : v + 1) {
  all_true_ = v == 0x1ff;
}

void LE::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  if (all_true_) return;

  SlotRef* slot = (SlotRef*)GetChild(0);
  ColumnReader& cr = cols[slot->GetSlotOffset()];
  __m256i T = cr.dec_->Top();

  __m256i C = _mm256_sub_epi64(val_, Min_);
  __m256i t1 = _mm256_or_si256(T, M_);
  __m256i t2 = _mm256_and_si256(Min_, NotM_);
  __m256i L = _mm256_sub_epi64(t1, t2);
  t1 = _mm256_and_si256(C, NotM_);
  t2 = _mm256_and_si256(L, NotM_);
  __m256i U = _mm256_sub_epi64(t1, t2);
  t1 = _mm256_xor_si256(L, U);
  t2 = _mm256_xor_si256(Min_, C);
  __m256i R = _mm256_xor_si256(t1, t2);
  flag = _mm256_or_si256(flag, R);
}

} // namespace impala
