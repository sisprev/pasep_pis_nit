require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.pattern = 'test/**/*_spec.rb'
end

task :console do
  exec "irb -r sisprev/pasep_pis_nit -I ./lib"
end

task :default => :test

