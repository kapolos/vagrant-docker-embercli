Vagrant.require_version ">= 1.6.0"

Vagrant.configure(2) do |config|

  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

  config.vm.provider "docker" do |d|

    d.vagrant_vagrantfile = "../dduportal_boot2docker/Vagrantfile"
    d.build_dir = "."
    
    config.vm.boot_timeout = 30

    d.has_ssh = true
    config.ssh.username = "root"
    config.ssh.private_key_path = "insecure_key"

    d.ports = ["10001:4200", "10002:35729"]
  end

  config.vm.synced_folder "webroot", "/webroot", type: "rsync",
    exclude: ["bower_components", "node_modules", "tmp", ".idea", ".git"]
  
end