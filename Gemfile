source :rubygems

chef_version = []
unless ENV['CHEF_VERSION'].to_s.empty?
  chef_version = Gem::Requirement.new(ENV['CHEF_VERSION'])
end

gem 'rake'
gem 'berkshelf', '~> 1.1'
gem 'chef', chef_version

group :development do
  gem 'vagrant', '~> 1.0.5'
end

group :test do
  gem 'foodcritic', '~> 1.7'
end
