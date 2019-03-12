#include "just_all_the_same.h"

VALUE rb_mJustAllTheSame;

void
Init_just_all_the_same(void)
{
  rb_mJustAllTheSame = rb_define_module("JustAllTheSame");
}
