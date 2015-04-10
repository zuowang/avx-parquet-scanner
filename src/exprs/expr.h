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


#ifndef IMPALA_EXPRS_EXPR_H
#define IMPALA_EXPRS_EXPR_H

#include <string>
#include <vector>
#include <sstream>
#include <immintrin.h>

namespace impala {

class Expr;

// This is the superclass of all expr evaluation nodes.
class Expr {
 public:
  virtual ~Expr();

  void AddChild(Expr* expr) { children_.push_back(expr); }
  Expr* GetChild(int i) const { return children_[i]; }
  int GetNumChildren() const { return children_.size(); }

  const std::vector<Expr*>& children() const { return children_; }

  virtual std::string DebugString() const;
  static std::string DebugString(const std::vector<Expr*>& exprs);

 protected:
  Expr() {}

  std::vector<Expr*> children_;

  // Simple debug string that provides no expr subclass-specific information
  std::string DebugString(const std::string& expr_name) const {
    std::stringstream out;
    out << expr_name << "(" << Expr::DebugString() << ")";
    return out.str();
  }

 private:

};

}

#endif
