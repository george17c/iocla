// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * Functie generica pentru calcularea valorii maxime dintr-un array.
 * n este dimensiunea array-ului
 * element_size este dimensiunea unui element din array
 * Se va parcurge vectorul arr, iar la fiecare iteratie sa va verifica
 * daca functia compare intoarce 1, caz in care elementul curent va fi
 * si cel maxim.
 * Pentru a folosi corect aritmetica pe pointeri vom inmulti indexul curent
 * din parcurgere cu dimensiunea unui element.
 * Astfel, pentru accesarea elementului curent avem:
 * void *cur_element = (char *)arr + index * element_size;
 */

void *find_max(void *arr, int n, int element_size,
               int (*compare)(const void *, const void *)) {
  void *max_elem = arr;
  int i;
  for (i = 0; i < n; i++) {
    void *cur_element = (char *)arr + i * element_size;
    if ((*compare)(cur_element, max_elem)) {
      max_elem = cur_element;
    }
  }

  return max_elem;
}

int compare(const void *a, const void *b) {
  if ((*(int *)a - *(int *)b) > 0) return 1;
  return 0;
}

int main(void) {
  int n;

  scanf("%d", &n);

  int *arr = malloc(n * sizeof(*arr));

  for (int i = 0; i < n; ++i) scanf("%d", &arr[i]);

  printf("Max: %d\n", *(int *)find_max(arr, n, sizeof(*arr), compare));

  free(arr);
  return 0;
}
