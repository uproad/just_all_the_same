#include "just_all_the_same.h"

VALUE rb_mJustAllTheSame;

static VALUE
all_nil_p(VALUE ary)
{
  VALUE *forward_p = RARRAY_PTR(ary);

  if (forward_p[0] != Qnil) return Qfalse;

  VALUE *backward_p;

  long size = RARRAY_LEN(ary);
  long s = size;      // size of foward_ary + backward_aray
  long v = size / 2;  // splitting index
  int cmpresult;

  while (v >= 1)
  {
    backward_p = forward_p + v;

    /* check last of array nil? if size is not odd? */
    if (s%2 && forward_p[s-1] != Qnil) return Qfalse;

    /* check quick same back and fowerd */
    if (memcmp(forward_p, backward_p, sizeof(VALUE) * v)) return Qfalse;

    s = v;
    v /= 2;
  }

  return Qtrue;
}

void
Init_just_all_the_same(void)
{
  rb_define_method(rb_cArray, "all_nil?", all_nil_p, 0);
}
