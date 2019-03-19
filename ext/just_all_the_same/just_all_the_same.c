#include "just_all_the_same.h"

VALUE rb_mJustAllTheSame;

static VALUE
all_nil_p(VALUE ary)
{
  return Qtrue;
}
void
Init_just_all_the_same(void)
{
  rb_define_method(rb_cArray, "all_nil?", all_nil_p, 0);
}
