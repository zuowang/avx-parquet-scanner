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

#ifndef IMPALA_EXPRS_OPERATORS_H
#define IMPALA_EXPRS_OPERATORS_H

#include "exprs/predicate.h"

namespace impala {

// Operators written against the UDF interface.
class Operators : public Predicate {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  Operators(Expr* child0, int v);

  ~Operators();

 protected:
  __m256i val_;

};

class EQ : public Operators {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  EQ(Expr* child0, int v);

 private:
};

class NE : public Operators {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  NE(Expr* child0, int v);

 private:
};

class GT : public Operators {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  GT(Expr* child0, int v);

 private:
};

class LT : public Operators {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  LT(Expr* child0, int v);

 private:
};

class GE : public Operators {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  GE(Expr* child0, int v);

 private:
};

class LE : public Operators {
 public:
  virtual void Eval(vector<ColumnReader>& cols, __m256i& flag);

  LE(Expr* child0, int v);

 private:
};

} // namespace impala
#endif

