#include "netbsd_sysinfo.h"

VALUE rb_mNetbsdSysinfo;

#include <stdlib.h>
#include <stdio.h>

#include <kvm.h>
#include <sys/param.h>
#include <sys/sysctl.h>
#include <unistd.h>

#define NLOAD 3

VALUE loadavg(VALUE self)
{
	double loadavg[NLOAD];
	int i, r;
	VALUE ret;

	r = getloadavg(loadavg, NLOAD);

	ret = rb_ary_new2(r);
	for(i = 0; i < r; i++) rb_ary_push(ret, rb_float_new(loadavg[i]));

	return ret;
}

VALUE nprocs(VALUE self)
{
	int cnt = 0;
	kvm_t *kd;
	kd = kvm_open(NULL, NULL, NULL, KVM_NO_FILES, NULL);
	if (!kd) rb_raise(rb_eSystemCallError, "kvm_open() returned NULL");
	if (!kvm_getproc2(kd, KERN_PROC_UID, getuid(), sizeof(struct kinfo_proc2), &cnt))
		{
			kvm_close(kd);
			rb_raise(rb_eSystemCallError, "kvm_getproc2() returned NULL");
		}
	kvm_close(kd);
	return INT2FIX(cnt);
}

Init_sysinfo(void)
{
	rb_mNetbsdSysinfo = rb_define_module("NetbsdSysinfo");
	rb_define_module_function(rb_mNetbsdSysinfo, "loadavg", loadavg, 0);
	rb_define_module_function(rb_mNetbsdSysinfo, "nprocs", nprocs, 0);
}
