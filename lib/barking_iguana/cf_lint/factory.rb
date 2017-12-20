module BarkingIguana
  module CfLint
    class Factory < Struct.new(:options)
      include BarkingIguana::Logging::Helper
      def build template
        logger.debug { "Building linter for template #{template.inspect}" }
        Linter.new(template, rules)
      end

      private

      def profile
        ProfileLoader.new(options[:profile]).run
      end

      def rules
        RuleLoader.new(options[:rule_directory], profile).run
      end
    end
  end
end
