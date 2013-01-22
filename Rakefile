require 'foodcritic'

task :default => [:foodcritic]

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['correctness']}
end
