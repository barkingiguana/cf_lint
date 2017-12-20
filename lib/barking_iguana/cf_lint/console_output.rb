module BarkingIguana
  module CfLint
    class ConsoleOutput < Struct.new(:options)
      EXIT_CRITICAL = 2
      EXIT_WARNING = 1
      EXIT_NORMAL = 0

      attr_accessor :reports
      private :reports=, :reports

      def start
        self.reports = []
        $stdout.puts "Processing #{options[:template].size} template files..."
      end

      def add_report report
        reports << report
        message = if report.results.empty?
                    "no issues"
                  else
                    report.results.map(&:to_s).join("\n  ")
                  end
        $stdout.puts "#{report.template.name}:\n  #{message}"
      end

      def finish
        $stdout.puts "Finished"
        exit exit_code
      end

      private

      def exit_code
        return EXIT_CRITICAL if exit_critical? && report_critical?
        return EXIT_WARNING if exit_warning? && report_warning?
        EXIT_NORMAL
      end

      def exit_critical?
        options[:critical]
      end

      def exit_warning?
        options[:warning]
      end

      def report_critical?
        reports.any?(&:critical?)
      end

      def report_warning?
        reports.any?(&:warning?)
      end
    end
  end
end
