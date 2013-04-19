require 'foodcritic'

desc "Run all tests"
task :default => [:foodcritic, :knife, :chefspec]

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['any']}
end

desc "Test cookbooks via knife"
task :knife do
  dirname = File.basename(File.expand_path('..', __FILE__))
  sh %{knife cookbook test -o .. #{dirname}}
end

desc "Run ChefSpec Unit Tests"
task :chefspec => :berks do
  sh %{rspec --color tmp/cookbooks/debian/spec}
end

desc "Install Berkshelf shims"
task :berks do
  sh %{berks install --path=tmp/cookbooks}
end
