#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void mirror(char *s) {
  int l = strlen(s), i, j;
  i = 0;
  j = l - 1;

  char aux;
  while (i < j) {
    aux = *(s + i);
    *(s + i) = *(s + j);
    *(s + j) = aux;
    i++;
    j--;
  }
}

int main(void) {
  char sir[] = "Ana n-are mere";

  mirror(sir);
  puts(sir);

  return 0;
}