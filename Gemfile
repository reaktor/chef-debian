source 'https://rubygems.org/'

chef_version = Gem::Requirement.new(ENV.fetch('CHEF_VERSION', '>= 10'))

gem 'chef', chef_version
gem 'rake'

group :development, :test do
  gem 'berkshelf',  '~> 1.3'
  gem 'chefspec',   '~> 1.0'
  gem 'foodcritic', '~> 2.0'
  gem 'tailor',     '~> 1.2'
end

group :development do
  gem 'guard-foodcritic', '>= 1.0.1'
end
