module BarkingIguana
  module CfLint
    class RuleResult < Struct.new(:rule, :identifiers, :level)
      Profile::LEVELS.each do |l|
        define_method "#{l.downcase}?" do
          return false if identifiers.empty?
          level == l
        end
      end

      def empty?
        identifiers.empty?
      end

      def to_s
        "[#{level}] #{identifiers.sort.join(", ")}: #{rule.description}"
      end
    end
  end
end
