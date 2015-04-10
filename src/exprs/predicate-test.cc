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

#include "exprs/predicate.h"

#include <iostream>
#include <vector>
#include <bitset>

#include "encoding/fixlen-encoding.h"

#include "exprs/compound-predicates.h"
#include "exprs/in-predicate.h"
#include "exprs/operators.h"
#include "exprs/slot-ref.h"

using namespace std;
using namespace impala;

namespace impala {
  const int COLUMN_DATALEN = 102400 * 64;

  int main() {
    vector<ColumnReader> cols(6, ColumnReader());

    for (int i = 0; i< 6; ++i) {
      cols[i].len_ = COLUMN_DATALEN;
      cols[i].data_ = new int8_t[COLUMN_DATALEN];
      cols[i].dec_ = new FixLenDecoder<9>((const char*)cols[i].data_, cols[i].len_);
    }

    SlotRef slot0(0);
    EQ op1(&slot0, 3);
    SlotRef slot1(1);
    EQ op2(&slot1, 4);
    AndPredicate and1(&op1, &op2);
    SlotRef slot2(2);
    vector<int> v1{5, 6, 8};
    InPredicate in1(&slot2, v1);
    AndPredicate and2(&and1, &in1);
    SlotRef slot3(3);
    LE op3(&slot3, 11);
    vector<int> v2{15, 16, 17};
    InPredicate in2(&slot3, v2);
    OrPredicate or1(&op3, &in2);
    AndPredicate and3(&and2, &or1);
    SlotRef slot4(4);
    GT op4(&slot4, 5);
    SlotRef slot5(5);
    LE op5(&slot5, 60);
    AndPredicate and4(&op4, &op5);
    OrPredicate root_or(&and3, &and4);
    __m256i v32 = _mm256_slli_epi32(_mm256_set1_epi32(1), 8);
    __m256i v9 = _mm256_or_si256(v32, _mm256_slli_epi32(v32, 9));
    v9 = _mm256_or_si256(v9, _mm256_slli_epi32(v32, 18));
    v9 = _mm256_or_si256(v9, _mm256_slli_epi32(v32, 27));
    __m256i shiftmask1 = _mm256_set1_epi32(0xffffffff);
    __m256i flag = _mm256_sllv_epi32(v9, shiftmask1);
    root_or.Eval(cols, flag);
    int64_t out[4];
    _mm256_storeu_si256((__m256i*)out, flag);
    for (int i = 0; i < 4; ++i) {
      bitset<64> bl(out[i]);
      cout << bl << endl;
    }
    // TODO
    return 0;
  }
} // namespace impala
