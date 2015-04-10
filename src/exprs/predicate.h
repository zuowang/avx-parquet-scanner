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


#ifndef IMPALA_EXPRS_PREDICATE_H_
#define IMPALA_EXPRS_PREDICATE_H_
#include <vector>
#include "exprs/expr.h"
#include "encoding/fixlen-encoding.h"

using namespace std;

namespace impala {

class ColumnReader {
 public:
  int8_t* data_;
  int len_;
  FixLenDecoder<9>* dec_;
};

class Predicate : public Expr {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  bool IsAllTrue() { return all_true_; }
  bool IsAllFalse() { return all_false_; }

 protected:
  Predicate()
  : all_true_(false),
    all_false_(false) {
  }

  bool all_true_;
  bool all_false_;

  static inline __m256i InitM();
  static inline __m256i NotM();

  static __m256i M_;
  static __m256i NotM_;
  static __m256i Max_;
  static __m256i Min_;
  static __m256i shiftmask1;
};

__m256i Predicate::M_ = Predicate::InitM();
__m256i Predicate::NotM_ = Predicate::NotM();
__m256i Predicate::Max_ = _mm256_set1_epi32(0xffffffff);
__m256i Predicate::Min_ = _mm256_setzero_si256();

__m256i Predicate::InitM() {
  __m256i v32 = _mm256_slli_epi32(_mm256_set1_epi32(1), 8);
  __m256i v9 = _mm256_or_si256(v32, _mm256_slli_epi32(v32, 9));
  v9 = _mm256_or_si256(v9, _mm256_slli_epi32(v32, 18));
  v9 = _mm256_or_si256(v9, _mm256_slli_epi32(v32, 27));
  v9 = _mm256_sllv_epi32(v9, shiftmask1);
  return _mm256_or_si256(v9, _mm256_srli_epi64(v32, 5));
}

__m256i Predicate::NotM() {
  __m256i one = _mm256_set1_epi32(0xffffffff);
  return _mm256_andnot_si256(one, M_);
}

}

#endif
