require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  config.vm.box       = "reaktor-debian-6.0"
  config.vm.box_url   = "https://reaktor-vm.s3.amazonaws.com/vagrant/reaktor-debian-6.0.box"

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug if ENV['DEBUG']

    recipes = ENV['RECIPES'] || "default"
    recipes.split.each do |recipe|
      chef.add_recipe "debian::#{recipe}"
    end
  end
end
