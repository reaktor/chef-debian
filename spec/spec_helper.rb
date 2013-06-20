require 'berkshelf'
require 'chefspec'
require 'pathname'

spec_root     = Pathname(__FILE__).parent
cookbook_root = spec_root.parent

# Load helpers
Dir["#{spec_root}/support/**/*.rb"].each { |f| require f }

# Add cookbook's libraries/ to the load path
$:.unshift(cookbook_root.join('libraries'))

Berkshelf.ui.mute!
berksfile = cookbook_root.join('Berksfile')
berks = Berkshelf::Berksfile.from_file(berksfile)
berks.install(path: 'vendor/cookbooks', except: 'integration')

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.color = true
  config.tty = true
end
