require 'foodcritic'

task :default => [:foodcritic, :knife]

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['correctness']}
end

desc "Install Berkshelf shims"
task :berks do
  sh %{berks install --path ./cookbooks}
end

desc "Test cookbooks via knife"
task :knife do
  sh %{knife cookbook test -o cookbooks debian}
end
