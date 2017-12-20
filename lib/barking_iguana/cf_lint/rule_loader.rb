module BarkingIguana
  module CfLint
    class RuleLoader < Struct.new(:directories, :profile)
      include BarkingIguana::Logging::Helper
      include BarkingIguana::Benchmark

      def run
        benchmark "Loading rules..." do
          directories.each do |directory|
            benchmark "Processing #{directory}..." do
              files = Dir[File.expand_path('./**/*_rule.rb', directory)]
              files.each do |f|
                require f
              end
            end
          end

          logger.debug { "Registering Rule module children" }
          rule_set = RuleSet.new profile
          ObjectSpace.each_object(Class) do |rule|
            next unless rule.included_modules.include? Rule
            instance = rule.new
            logger.debug { "Registring #{instance}" }
            rule_set.add instance
          end
          rule_set
        end
      end
    end
  end
end
