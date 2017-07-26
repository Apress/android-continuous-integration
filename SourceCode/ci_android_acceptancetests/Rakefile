require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'logger'
require 'yaml'
require 'psych'


Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

task :default => :features