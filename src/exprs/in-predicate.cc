// Copyright 2015 Cloudera Inc.
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

#include <sstream>

#include "exprs/in-predicate.h"
#include "exprs/literal.h"
#include "slot-ref.h"

using namespace std;
using namespace impala;

namespace impala {

InPredicate::InPredicate(Expr* child0, vector<int> v) {
  AddChild(child0);
  in_vals_.resize(v.size());
  for (int i = 0; i < v.size(); ++i) {
    AddChild(new Literal(v[i]));
    __m256i shiftmask1 = _mm256_setr_epi32(0, 4, 0 ,4, 0, 4, 0, 4);
    __m256i v32 = _mm256_set1_epi32(v[i]);
    __m256i v9 = _mm256_or_si256(v32, _mm256_slli_epi32(v32, 9));
    v9 = _mm256_or_si256(v9, _mm256_slli_epi32(v32, 18));
    v9 = _mm256_or_si256(v9, _mm256_slli_epi32(v32, 27));
    v9 = _mm256_sllv_epi32(v9, shiftmask1);
    in_vals_[i] = _mm256_or_si256(v9, _mm256_srli_epi64(v32, 5));
  }
}

InPredicate::~InPredicate() {
  for (int i = 1; i < GetNumChildren(); ++i) delete GetChild(i);
}

//initalize in the first run
void InPredicate::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  SlotRef* slot = (SlotRef*)GetChild(0);
  ColumnReader& cr = cols[slot->GetSlotOffset()];
  __m256i T = cr.dec_->Top();

  for (int i = 0; i < in_vals_.size(); ++i) {
    __m256i D = _mm256_xor_si256(T, in_vals_[i]);
    __m256i tmp = _mm256_and_si256(D, M_);
    tmp = _mm256_add_epi64(tmp, M_);
    __m256i R = _mm256_or_si256(D, tmp);
    flag = _mm256_or_si256(flag, R);
  }
}

}
