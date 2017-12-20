module BarkingIguana
  module CfLint
    class Template < Struct.new(:name, :body)
      def self.load file
        new file, File.read(file)
      end

      def model
        @model ||= CfnParser.new.parse(body)
      end

      def method_missing name, *args
        super unless model.respond_to? name
        model.public_send name, *args
      end
    end
  end
end
