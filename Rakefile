require 'rake/testtask'

namespace :sanitation do
  desc "Check line lengths & whitespace with Cane"
  task :lines do
    puts ""
    puts "== using cane to check line length =="
    system("cane --no-abc --style-glob 'lib/**/*.rb' --no-doc")
    puts "== done checking line length =="
    puts ""
  end

  desc "Check method length with Reek"
  task :methods do
    puts ""
    puts "== using reek to check method length =="
    system("reek -n lib/*.rb 2>&1 | grep -v ' 0 warnings'")
    puts "== done checking method length =="
    puts ""
  end

  desc "Check both line length and method length"
  task :all => [:lines, :methods]
end

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end

task default: :test

# # Cane Test 
# begin
#   require 'cane/rake_task'
#
#   desc "Run cane to check quality metrics"
#   Cane::RakeTask.new(:quality) do |cane|
#     cane.abc_max = 10
#     cane.add_threshold 'coverage/covered_percent', :>=, 99
#     cane.no_style = true
#     cane.abc_exclude = %w(Foo::Bar#some_method)
#   end
#
#   task :default => :quality
# rescue LoadError
#   warn "cane not available, quality task not provided."
# end
