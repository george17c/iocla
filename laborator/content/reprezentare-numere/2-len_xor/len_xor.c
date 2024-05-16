#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int my_strlen(const char *str) {
  int len = 0;
  while (*str) {
    len++;
    str++;
  }
  return len - 1;
}

void equality_check(const char *str, int l) {
  int i, I;
  for (i = 0; i < l; i++) {
    I = i + (1 << i);
    if (I > l) {
      if (*(str + i) % *(str + I))
        printf("Address of %c: %p\n", *(str + i), (str + i));
    } else if (*(str + i) ^ *(str + I))
      printf("Address of %c: %p\n", *(str + i), (str + i));
  }
}

int main(void) {
  char s[100];
  int l;

  fgets(s, 100, stdin);
  l = my_strlen(s);

  printf("length = %d\n", l);
  equality_check(s, l);

  return 0;
}
