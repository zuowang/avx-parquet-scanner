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


#ifndef IMPALA_EXPRS_COMPOUND_PREDICATES_H_
#define IMPALA_EXPRS_COMPOUND_PREDICATES_H_

#include <string>
#include "exprs/predicate.h"

namespace impala {

class CompoundPredicate: public Predicate {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

 protected:
  CompoundPredicate(Expr* child0, Expr* child1);

};

// Expr for evaluating and (&&) operators
class AndPredicate: public CompoundPredicate {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  AndPredicate(Predicate* child0, Predicate* child1);

 protected:
  friend class Expr;

  virtual std::string DebugString() const {
    std::stringstream out;
    out << "AndPredicate(" << Expr::DebugString() << ")";
    return out.str();
  }
};

// Expr for evaluating or (||) operators
class OrPredicate: public CompoundPredicate {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  OrPredicate(Predicate* child0, Predicate* child1);

 protected:
  friend class Expr;

  virtual std::string DebugString() const {
    std::stringstream out;
    out << "OrPredicate(" << Expr::DebugString() << ")";
    return out.str();
  }
};

}

#endif
