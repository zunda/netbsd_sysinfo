require "test_helper"

class NetbsdSysinfoTest < Minitest::Test
	def test_that_it_has_a_version_number
		refute_nil ::NetbsdSysinfo::VERSION
	end

	def test_loadavg
		load = NetbsdSysinfo::loadavg
		loaduptime = `uptime`.strip.split( /[, ]+/ ).slice(-3..-1).map{ |v| v.to_f }
		assert_equal( 3, load.size )
		load.zip( loaduptime ).each do |v|
			assert_in_delta( v[1], v[0], 1e-2 )
		end
	end

	def test_nprocs
		nprocs = NetbsdSysinfo::nprocs
		whoami = `whoami`
		nprocs_ps = `ps -x -U #{whoami}`.delete("^\n").size - 3
		# 3: header line, shell, and ps process itself
		assert_equal( nprocs_ps, nprocs )
	end
end
