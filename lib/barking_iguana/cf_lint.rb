require 'time'
require 'optparse'
require 'cfn-model'
require 'barking_iguana/logging'
require 'barking_iguana/benchmark'
require 'barking_iguana/cf_lint/version'
require 'barking_iguana/cf_lint/cli'
require 'barking_iguana/cf_lint/console_output'
require 'barking_iguana/cf_lint/factory'
require 'barking_iguana/cf_lint/template'
require 'barking_iguana/cf_lint/linter'
require 'barking_iguana/cf_lint/profile'
require 'barking_iguana/cf_lint/profile_loader'
require 'barking_iguana/cf_lint/report'
require 'barking_iguana/cf_lint/rule'
require 'barking_iguana/cf_lint/rule_set'
require 'barking_iguana/cf_lint/rule_loader'
require 'barking_iguana/cf_lint/rule_in_profile'
require 'barking_iguana/cf_lint/rule_result'

module BarkingIguana
  module CfLint
    def self.factory options
      Factory.new options
    end
  end
end
