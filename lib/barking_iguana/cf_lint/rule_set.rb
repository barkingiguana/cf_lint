module BarkingIguana
  module CfLint
    class RuleSet
      include BarkingIguana::Logging::Helper

      attr_accessor :profile
      private :profile=, :profile

      attr_accessor :rules
      private :rules=, :rules

      def initialize profile
        self.profile = profile
        self.rules = {}
      end

      def add rule
        logger.debug { "RuleSet registering rule #{rule}" }
        rules[rule.id] = rule
      end

      def each
        rules.each_pair do |id, rule|
          pr = RuleInProfile.new(rule, profile[rule.id])
          yield pr
        end
      end

      include Enumerable
    end
  end
end
