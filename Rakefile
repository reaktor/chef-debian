require 'foodcritic'
require 'tailor/rake_task'

desc "Run all tests"
task :default => [:foodcritic, :knife, :chefspec, :tailor]

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['any']}
end

Tailor::RakeTask.new do |t|
  t.file_set('metadata.rb', "metadata")
  %w[attributes definitions libraries providers recipes resources].each do |dir|
    t.file_set("#{dir}/**/*.rb", dir) do |style|
      style.max_line_length 120, :level => :warn
      style.spaces_after_comma 1, :level => :off
    end
  end
  t.file_set('spec/**/*.rb', "tests") do |style|
    style.max_line_length 160, :level => :warn
  end
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
