#include <stdio.h>

/*
 * Afisati adresele elementelor din vectorul "v" impreuna cu valorile
 * de la acestea.
 * Parcurgeti adresele, pe rand, din octet in octet,
 * din 2 in 2 octeti si apoi din 4 in 4.
 */

int main(void) {
  int v[] = {0xCAFEBABE, 0xDEADBEEF, 0x0B00B135, 0xBAADF00D, 0xDEADC0DE};

  unsigned int *p = (unsigned int *)&v, i;
  unsigned short *s = (unsigned short *)&v;
  unsigned char *c = (unsigned char *)&v;

  for (i = 0; i < sizeof(v) / sizeof(p); i++) {
    printf("adr: %p   val: %x\n", p, *p);
    p++;
  }
  printf("\n");

  for (i = 0; i < sizeof(v) / (int)sizeof(*s); i++) {
    printf("adr: %p   val: %x\n", s, *s);
    s++;
  }
  printf("\n");

  for (i = 0; i < sizeof(v) / (int)sizeof(*c); i++) {
    printf("adr: %p   val: %x\n", c, *c);
    c++;
  }
  return 0;
}
