Vagrant.configure('2') do |config|
  if ENV['WHEEZY']
    config.vm.box     = 'debian-7.0'
  else
    config.vm.box     = 'debian-6.0'
    config.vm.box_url = 'https://reaktor-vm.s3.amazonaws.com/vagrant/reaktor-debian-6.0.box'
  end

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug if ENV['DEBUG']

    chef.cookbooks_path = 'cookbooks'

    recipes = ENV['RECIPES'] || 'default'
    recipes.split.each do |recipe|
      chef.add_recipe "debian::#{recipe}"
    end
  end
end
