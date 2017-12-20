module BarkingIguana
  module CfLint
    class Report
      attr_accessor :template
      private :template=

      attr_accessor :results
      private :results=

      def initialize template
        self.template = template
        self.results = []
      end

      def add result
        results << result
      end

      Profile::LEVELS.each do |l|
        define_method "#{l.downcase}?" do
          results.any? { |r| r.public_send "#{l.downcase}?" }
        end
      end
    end
  end
end
