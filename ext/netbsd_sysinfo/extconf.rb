require "mkmf"
have_library('kvm')
create_makefile("netbsd_sysinfo/netbsd_sysinfo")
