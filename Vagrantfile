Vagrant.configure('2') do |config|
  config.vm.define "gitlab.local" do |machine|
    machine.vm.box = 'generic/ubuntu2204'
    machine.vm.hostname = "gitlab.local"
    config.vm.network "public_network", ip:192.168.33.25
    machine.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "gitlab"
      vb.cpus = '2'
      vb.memory = '4096'
    end
    config.vm.provision "shell", inline: <<-SHELL
    ip a
    ufw enable
    apt-get update
    apt upgrade
    apt-get install -y curl openssh-server ca-certificates tzdata perl
    apt install postfix
    ufw allow http
    ufw allow https
    ufw allow OpenSSH
    cd /tmp
    curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
    apt install gitlab-ce
    sudo sed -i "s|external_url 'http://gitlab.example.com'|external_url 'https://galba.freeboxos.fr'|" /etc/gitlab/gitlab.rb
    sudo sed -i "s|# letsencrypt\\['enable'\\] = nil| letsencrypt\\['enable'\\] = true|" /etc/gitlab/gitlab.rb
    sudo sed -i "s|# letsencrypt\\['contact_emails'\\] = \\[\\]| letsencrypt\\['contact_emails'\\] = \\[\\'armanpvp@gmail.com\\'\\]|" /etc/gitlab/gitlab.rb
    sudo sed -i "s|# letsencrypt\\['auto_renew'\\] = true| letsencrypt\\['auto_renew'\\] = true|" /etc/gitlab/gitlab.rb
    sudo sed -i "s|# letsencrypt\\['auto_renew_hour'\\] = 0| letsencrypt\\['auto_renew_hour'\\] = \\\"12\\\"|" /etc/gitlab/gitlab.rb
    sudo sed -i "s|# letsencrypt\\['auto_renew_minute'\\] = nil| letsencrypt\\['auto_renew_minute'\\] = \\\"30\\\"|" /etc/gitlab/gitlab.rb
    sudo sed -i "s|# letsencrypt\\['auto_renew_day_of_month'\\] = \\\"\\*/4\\\"| letsencrypt\\['auto_renew_day_of_month'\\] = \\\"\\*/7\\\"|" /etc/gitlab/gitlab.rb
    gitlab-ctl reconfigure
    SHELL
  end
end


