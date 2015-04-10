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

#include "exprs/compound-predicates.h"

using namespace impala;

CompoundPredicate::CompoundPredicate(Expr* child0, Expr* child1) {
  AddChild(child0);
  AddChild(child1);
}

AndPredicate::AndPredicate(Predicate* child0, Predicate* child1)
  : CompoundPredicate(child0, child1) {
  if (child0->IsAllFalse() || child1->IsAllFalse()) all_false_ = true;
  if (child0->IsAllTrue() && child1->IsAllTrue()) all_true_ = true;
}

void AndPredicate::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  if (all_true_) return;
  if (all_false_) {
    flag = _mm256_and_si256(flag, _mm256_setzero_si256());
    return;
  }

  __m256i flag1 = flag;
  static_cast<Predicate*>(GetChild(0))->Eval(cols, flag1);
  __m256i flag2 = flag;
  static_cast<Predicate*>(GetChild(1))->Eval(cols, flag2);
  flag = _mm256_and_si256(flag1, flag2);
}

OrPredicate::OrPredicate(Predicate* child0, Predicate* child1)
  : CompoundPredicate(child0, child1) {
  if (child0->IsAllTrue() || child1->IsAllTrue()) all_true_ = true;
  if (child0->IsAllFalse() && child1->IsAllFalse()) all_false_ = true;
}

void OrPredicate::Eval(vector<ColumnReader>& cols, __m256i& flag) {
  if (all_true_) return;
  if (all_false_) {
    flag = _mm256_and_si256(flag, _mm256_setzero_si256());
    return;
  }

  __m256i flag1 = flag;
  static_cast<Predicate*>(GetChild(0))->Eval(cols, flag1);
  __m256i flag2 = flag;
  static_cast<Predicate*>(GetChild(1))->Eval(cols, flag2);
  flag = _mm256_or_si256(flag1, flag2);
}
