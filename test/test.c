#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>
#include <caml/callback.h>

#include "xmlm.h"


int main(void)
{
  mpz_t x;
  mpz_init(x);
  mpz_set_str(x, "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890", 10);

  struct x a ;
  a.z = x;

  ocaml_print(&a);
  return EXIT_SUCCESS;
}
