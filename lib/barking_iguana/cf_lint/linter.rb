module BarkingIguana
  module CfLint
    class Linter < Struct.new(:template, :rule_set)
      include BarkingIguana::Logging::Helper

      def run
        report = Report.new template
        rule_set.each do |rule|
          result = rule.apply_to template
          next if result.empty?
          report.add result
        end
        report
      end
    end
  end
end

