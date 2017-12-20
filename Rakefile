begin
  require 'rspec/core/rake_task'
  desc "Run specs"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.fail_on_error = false
  end
  task default: :spec
rescue LoadError
end
