require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

desc 'Run all tests'
task default: [:foodcritic, :knife, :spec, :rubocop]

FoodCritic::Rake::LintTask.new do |t|
  t.options = { fail_tags: %w[~FC017] }
end

desc 'Run Knife cookbook tests'
task :knife do
  dirname = File.basename(File.dirname(__FILE__))
  sh 'knife', 'cookbook', 'test', dirname, '--cookbook-path', '..'
end

desc 'Run ChefSpec unit tests'
RSpec::Core::RakeTask.new

RuboCop::RakeTask.new
