module BarkingIguana
  module CfLint
    class ProfileLoader < Struct.new(:paths)
      include BarkingIguana::Logging::Helper
      include BarkingIguana::Benchmark

      def run
        benchmark "Loading profile..." do
          paths.inject(Profile.new) do |profile, path|
            benchmark "Processing #{path}..." do
              File.readlines(path).each do |entry|
                logger.debug { "Processing #{entry.inspect}" }
                next if entry =~ /^#/
                next if entry.to_s.strip == ''
                rule, level = entry.split(/ /, 2).map(&:strip)
                logger.debug { "Rule = #{rule.inspect}, level = #{level.inspect}" }
                begin
                  profile[rule] = level
                rescue => e
                  raise "Error processing #{path.inspect}: #{e.message}"
                end
              end
            end
            profile
          end
        end
      end
    end
  end
end
