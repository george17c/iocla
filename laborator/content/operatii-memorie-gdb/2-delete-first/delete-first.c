// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *delete_first(char *s, char *pattern) {
  char *p = strstr(s, pattern);
  strtok(s, pattern);
  strcat(s, p + strlen(pattern));
  return s;
}

int main(void) {
  char *s, *pattern;

  s = (char *)malloc(13 * sizeof(char));
  strcpy(s, "Ana are mere");
  pattern = (char *)malloc(3 * sizeof(char));
  strcpy(pattern, "re");

  printf("%s\n", delete_first(s, pattern));

  return 0;
}