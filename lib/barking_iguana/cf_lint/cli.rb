module BarkingIguana
  module CfLint
    class Cli < Struct.new(:argv)
      include BarkingIguana::Logging::Helper

      def options
        @options ||= parse_options
      end

      def parse_options
        opts = {
          warning: false,
          critical: true,
          log_level: 2,
          rule_directory: [],
          profile: [],
          template: []
        }

        parser = OptParse.new do |opt|
          opt.on '-w', '--[no-]warning', 'Exit non-zero on warnings' do |value|
            opts[:warning] = value
          end
          opt.on '-c', '--[no-]critical', 'Exit non-zero on criticals' do |value|
            opts[:critical] = value
          end
          opt.on '-v', '--verbose', 'Increase verbosity' do
            opts[:log_level] -= 1
          end
          opt.on '-q', '--quiet', 'Decrease verbosity' do
            opts[:log_level] += 1
          end
          opt.on '-r', '--rule-directory RULE_DIRECTORY' do |value|
            opts[:rule_directory] << value
          end
          opt.on '-p', '--profile PROFILE' do |value|
            opts[:profile] << value
          end
          opt.on '-t', '--template TEMPLATE' do |value|
            opts[:template] << value
          end
        end
        parser.parse! argv
        opts
      end

      def run
        configure_logging
        logger.debug { "Running with options: #{options.inspect}" }
        factory = BarkingIguana::CfLint.factory options
        output = BarkingIguana::CfLint::ConsoleOutput.new options
        output.start
        options[:template].each do |t|
          output.add_report factory.build(Template.load(t)).run
        end
        output.finish
      end

      private

      def configure_logging
        BarkingIguana::Logging.default_level = [ 0, [ 4, options[:log_level] ].min ].max
      end
    end
  end
end
