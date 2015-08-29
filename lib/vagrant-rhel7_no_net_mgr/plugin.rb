begin
  require 'vagrant'
rescue LoadError
  raise 'The Vagrant RHEL7 No Network Manager plugin must be run within vagrant.'
end

if Vagrant::VERSION < '1.6.0'
  raise 'The Vagrant RHEL7 No Network Manager plugin has only been tested with vagrant 1.6.x'
end

module VagrantPlugins
  module Rhel7NoNetMgr
    class Plugin < Vagrant.plugin('2')
      name "RHEL7 No Network Manager"
      description "Allows RHEL7 VMs with NetworkManager disabled to fallback to older network setup"

      guest('redhat7_nonetmgr', 'redhat') do
        require_relative 'guest'
        Guest
      end

      guest_capability('redhat7_nonetmgr', 'configure_networks') do
        require Vagrant.source_root.join('plugins/guests/redhat/cap/configure_networks')

        class ConfigureNetworks
          extend ::VagrantPlugins::GuestRedHat::Cap::ConfigureNetworks

          def self.configure_networks(machine, networks)
            #
            # We want to ensure that the older way of configuring the network 
            # is invoked, opposed to the 'configure_networks_rhel7' method
            #
            configure_networks_default(machine, networks)
          end
        end

        ConfigureNetworks
      end

    end

  end

end
