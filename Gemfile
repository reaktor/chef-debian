source 'https://rubygems.org/'

chef_version = []
unless ENV['CHEF_VERSION'].to_s.empty?
  chef_version = Gem::Requirement.new(ENV['CHEF_VERSION'])
end

gem 'rake'
gem 'chef', chef_version

group :test do
  gem 'berkshelf',  '~> 1.3'
  gem 'chefspec',   '>= 1.0.0.rc1'
  gem 'foodcritic', '~> 2.0'
end
