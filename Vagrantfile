Vagrant.configure('2') do |config|
  config.vm.box = ENV.fetch('BOX', 'debian-7.0')

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug if ENV['DEBUG']

    recipes = ENV['RECIPES'] || 'default'
    recipes.split.each do |recipe|
      chef.add_recipe "debian::#{recipe}"
    end
  end
end
