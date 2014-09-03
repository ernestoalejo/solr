

VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Solr app server
  config.vm.network "forwarded_port", guest: 8983, host: 8983

  # Copy .gitconfig file if it exists
  if File.file?(ENV['HOME'] + "/.gitconfig")
    config.vm.provision "file", source: "~/.gitconfig", destination: "/home/vagrant/.gitconfig"
  end

  # Copy .ssh/known_hosts file if it exists
  if File.file?(ENV['HOME'] + "/.ssh/known_hosts")
    config.vm.provision "file", source: "~/.ssh/known_hosts", destination: "/home/vagrant/.ssh/known_hosts"
  end

  # Provision scripts
  config.vm.provision "shell", path: "cmd/vagrant-provision/bootstrap.sh", privileged: false

  # Share SSH keys with the guest
  config.ssh.forward_agent = true

  # Virtual box configuration
  config.vm.provider :virtualbox do |vb|
    # Activate ioapic so we can have 2 cores
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]   
  end  
end
