// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "double.h"

int main() {
  unsigned long long val = 0xFFFFFFFF;
  unsigned long long double_val;

  double_val = compute_double(val);

  printf("2 * %llu = %llu\n", val, double_val);

  return 0;
}
