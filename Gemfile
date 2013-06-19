source 'https://rubygems.org/'

gem 'berkshelf', '~> 2.0'
gem 'chef', ENV.fetch('CHEF_VERSION', '~> 11.0')
gem 'chefspec', '~> 1.2'
gem 'foodcritic', '~> 2.0'
gem 'rake'
gem 'rspec', '~> 2.11'
gem 'tailor', '~> 1.2'

group :development do
  gem 'emeril', '~> 0.5'
  gem 'guard-rspec', '~> 3.0'
  gem 'guard-foodcritic', '>= 1.0.1'
end

group :integration do
  gem 'kitchen-vagrant', '>= 0.10.0'
  gem 'test-kitchen', '>= 1.0.0.alpha.7'
end
