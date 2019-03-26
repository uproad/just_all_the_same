#include "just_all_the_same.h"

VALUE rb_mJustAllTheSame;
#define SWITCH_TO_LINER 300

static VALUE
all_same_p(VALUE ary, VALUE target)
{
  long size = RARRAY_LEN(ary);

  if (size == 0) return Qtrue;

  VALUE *forward_p = RARRAY_PTR(ary);

  if (forward_p[0] != target) return Qfalse;

  VALUE *backward_p;

  long s = size;      // size of foward_ary + backward_aray
  long v = size / 2;  // splitting index

  /* split algorithm */
  while (v >= SWITCH_TO_LINER / 2)
  {
    backward_p = forward_p + v;

    /* check last of array nil? if size is not odd? */
    if (s%2 && forward_p[s-1] != target) return Qfalse;

    /* check quick same back and fowerd */
    if (memcmp(forward_p, backward_p, sizeof(VALUE) * v)) return Qfalse;

    s = v;
    v /= 2;
  }

  /* liner algorithm */
  for (long i = 1; i < s; i++) if (forward_p[i] != Qnil) return Qfalse;

  return Qtrue;
}

static VALUE
all_nil_p(VALUE ary)
{
  return all_same_p(ary, Qnil);
}

void
Init_just_all_the_same(void)
{
  rb_define_method(rb_cArray, "all_nil?" , all_nil_p , 0);
  rb_define_method(rb_cArray, "all_same?", all_same_p, 1);
}
