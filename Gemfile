source 'https://rubygems.org/'

chef_version = Gem::Requirement.new(ENV.fetch('CHEF_VERSION', '>= 10'))

gem 'rake'
gem 'chef', chef_version

group :test do
  gem 'berkshelf',  '~> 1.3'
  gem 'chefspec',   '~> 1.0'
  gem 'foodcritic', '~> 2.0'
end
