module BarkingIguana
  module CfLint
    class Profile
      LEVELS = %w(CRITICAL WARNING INFO)

      include BarkingIguana::Logging::Helper

      attr_accessor :rules
      private :rules=, :rules

      def initialize
        self.rules = {}
      end

      def []= rule_id, level
        logger.debug { "Setting #{rule_id.inspect} to #{level.inspect}, was #{rules[rule_id].inspect}" }
        raise "#{level.inspect} for rule #{rule_id.inspect} need to be one of #{LEVELS.sort.join(', ')}" unless LEVELS.include? level
        rules[rule_id] = level
      end

      def [] rule_id
        rules[rule_id]
      end
    end
  end
end
