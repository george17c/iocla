// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

int my_bsearch(int v[], int dest, int low, int high) {
  int mid;

my_while:
  if (low > high) goto not_found;
  mid = low + (high - low) / 2;

  if (v[mid] == dest) goto found;

  if (v[mid] < dest)
    goto L1;
  else
    goto L2;

  goto my_while;

L1:
  low = mid + 1;
  goto my_while;

L2:
  high = mid - 1;
  goto my_while;

found:
  return mid;

not_found:
  return -1;
}

int main(void) {
  int v[] = {1, 2, 15, 51, 53, 66, 202, 7000};
  int dest = v[2]; /* 15 */
  int start = 0;
  int end = sizeof(v) / sizeof(int) - 1;
  int ans;

  /* TODO: Implement binary search */
  ans = my_bsearch(v, dest, start, end);
  if (ans == -1)
    goto notFound;
  else
    goto found;

notFound:
  printf("Nu l-am gasit\n");
  return 0;

found:
  printf("L-am gasit la pozitia %d\n", ans);
  return 0;
}
