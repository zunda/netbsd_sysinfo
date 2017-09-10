# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "netbsd_sysinfo/version"

Gem::Specification.new do |spec|
  spec.name          = "netbsd_sysinfo"
  spec.version       = NetbsdSysinfo::VERSION
  spec.authors       = ["zunda"]
  spec.email         = ["zunda at freeshell.org"]

  spec.summary       = %q{A Ruby binding to extract load average and number of processes of the user on NetBSD}
  spec.homepage      = "https://github.com/zunda/netbsd_sysinfo"
  spec.license       = "MIT"
  spec.platform      = Gem::Platform.new('netbsd')
  # kvm_getproc2(3) seems to be only available on *BSD

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/netbsd_sysinfo/extconf.rb"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "minitest", "~> 5.0"
end
