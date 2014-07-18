require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

desc 'Run all tests'
task default: [:foodcritic, :knife, :spec, :rubocop]

FoodCritic::Rake::LintTask.new

desc 'Run Knife cookbook tests'
task :knife do
  dirname = File.basename(File.dirname(__FILE__))
  sh 'knife', 'cookbook', 'test', dirname, '--cookbook-path', '..'
end

desc 'Run ChefSpec unit tests'
RSpec::Core::RakeTask.new

RuboCop::RakeTask.new
