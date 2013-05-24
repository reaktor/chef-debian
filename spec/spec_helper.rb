require 'berkshelf'
require 'chefspec'

Berkshelf.ui.mute!
berksfile = File.expand_path('../../Berksfile', __FILE__)
berks = Berkshelf::Berksfile.from_file(berksfile)
berks.install(path: 'vendor/cookbooks', except: 'integration')

RSpec.configure do |config|
  config.color = true
  config.tty = true
end
