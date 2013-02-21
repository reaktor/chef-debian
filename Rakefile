require 'foodcritic'

task :default => [:foodcritic, :knife]

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['correctness']}
end

desc "Test cookbooks via knife"
task :knife do
  dirname = File.basename(File.expand_path('..', __FILE__))
  sh %{knife cookbook test -o .. #{dirname}}
end
