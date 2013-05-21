require 'emeril/rake'
require 'foodcritic'
require 'rspec/core/rake_task'
require 'tailor/rake_task'

COOKBOOK_NAME = 'debian'
FIXTURES_PATH = 'vendor/cookbooks'

desc 'Run all tests'
task :default => [:foodcritic, :knife, :spec, :tailor]

task :prepare do
  sh 'berks', 'install', '--path', FIXTURES_PATH, '--except', 'integration'
  # Run cleanup at exit unless an exception was raised.
  at_exit { Rake::Task['cleanup'].invoke if $!.nil? }
end

task :cleanup do
  rm_rf FIXTURES_PATH
end

FoodCritic::Rake::LintTask.new do |t|
  t.options = { :fail_tags => ['any'] }
end

desc 'Run Knife cookbook tests'
task :knife do
  dirname = File.basename(File.dirname(__FILE__))
  sh 'knife', 'cookbook', 'test', dirname, '--cookbook-path', '..'
end

desc 'Run ChefSpec unit tests'
RSpec::Core::RakeTask.new
task :spec => :prepare

Tailor::RakeTask.new do |t|
  t.file_set('metadata.rb', 'metadata')

  %w[attributes definitions libraries providers recipes resources].each do |dir|
    t.file_set("#{dir}/**/*.rb", dir) do |style|
      style.max_line_length 120, :level => :warn
      style.spaces_after_comma 1, :level => :off
    end
  end

  t.file_set('spec/**/*.rb', 'tests') do |style|
    style.max_line_length 160, :level => :warn
  end
end
