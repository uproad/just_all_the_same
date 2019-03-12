require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("just_all_the_same") do |ext|
  ext.lib_dir = "lib/just_all_the_same"
end

task :default => [:clobber, :compile, :spec]
