#include "just_all_the_same.h"

#undef __STRICT_ANSI__

VALUE rb_mJustAllTheSame;

void printb(unsigned int v) {
  unsigned int mask = (int)1 << (sizeof(v) * CHAR_BIT - 1);
  do putchar(mask & v ? '1' : '0');
  while (mask >>= 1);
}

void putb(unsigned int v) {
  putchar('0'), putchar('b'), printb(v), putchar('\n');
}

static VALUE
all_nil_p(VALUE ary)
{
/*  putb((unsigned int)Qnil);
  putb((unsigned int)Qtrue);
  putb((unsigned int)Qfalse);*/
  if (rb_ary_entry(ary, 0) != Qnil) return Qfalse;

  VALUE *forward_p = RARRAY_CONST_PTR(ary);

  VALUE *backward_p;

  long size = RARRAY_LEN(ary);
  long e;
  long v;

  for (v = size / 2, e = size; e > 2 ; e = v, v /= 2)
  {
    backward_p = forward_p + sizeof(VALUE) * v;
    if (forward_p[e-1] != Qnil) return Qfalse;

    if(memcmp(forward_p, backward_p, sizeof(VALUE) * v) == 0) return Qfalse;
  }

  return Qtrue;
}

void
Init_just_all_the_same(void)
{
  /*rb_mJustAllTheSame = rb_define_module("JustAllTheSame");*/

  rb_define_method(rb_cArray, "all_nil?", all_nil_p, 0);
}
