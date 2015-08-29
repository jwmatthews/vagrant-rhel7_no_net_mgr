module VagrantPlugins
  module Rhel7NoNetMgr
    class Guest < Vagrant.plugin('2', :guest)
      def detect?(machine)
        cmd = "systemctl status NetworkManager.service"
        not machine.communicate.test(cmd)
      end
    end
  end

end
