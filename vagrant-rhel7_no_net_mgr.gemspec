# coding: utf-8
$:.unshift File.expand_path('../lib', __FILE__)
require 'vagrant-rhel7_no_net_mgr/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-rhel7_no_net_mgr"
  spec.version       = VagrantPlugins::Rhel7NoNetMgr::VERSION
  spec.authors       = ["John Matthews", "Jesus Rodriguez"]
  spec.email         = ["jwmatthews@gmail.com", "jesusr@redhat.com"]
  spec.summary       = %q{Remove requirement of RHEL7 using Network Manager.}
  spec.description   = %q{Allows RHEL7 boxes with NetworkManager disabled to use the older configure network calls.}
  spec.homepage      = ""
  spec.license       = "GPLv2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
