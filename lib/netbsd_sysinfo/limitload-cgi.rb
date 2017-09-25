require "netbsd_sysinfo/version"
require 'netbsd_sysinfo/netbsd_sysinfo'

module NetbsdSysinfo
	class LimitloadCgi
		def LimitloadCgi.overload?(max_load_avg = 12, max_ps = 5)
			if max_load_avg < NetbsdSysinfo.loadavg[0]
				return 'Load average is too high.'
			elsif max_ps < NetbsdSysinfo.nprocs
				return 'Too many processes are now running.'
			end
			return false
		end

		def LimitloadCgi.exit_if_overload(max_load_avg = 12, max_ps = 5)
			reason = LimitloadCgi.overload?(max_load_avg, max_ps)
			if reason
				puts <<"_RES"; exit
Status: 503 Service Temporarily Unavailable
Content-type: text/html; charset=iso-8859-1

<html>
<head><title>503 Service Temporarily Unavailable</title></head>
<h1>503 Service Temporarily Unavailable</h1>
<p>#{reason}</p>
<p>Please check back later or have a look at the <a href="/">top page</a>.
</html>
_RES
			end
		end
	end
end

