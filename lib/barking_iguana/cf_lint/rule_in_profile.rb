module BarkingIguana
  module CfLint
    class RuleInProfile < Struct.new(:rule, :level)
      def apply_to template
        identifiers = rule.apply_to template
        RuleResult.new rule, identifiers, level
      end
    end
  end
end
