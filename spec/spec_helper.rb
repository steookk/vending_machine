# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('../lib'))

require 'byebug'
require 'vending_machine'

RSpec.configure do |config|
  # compatibility for rspec 4 #######
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  ##################################

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true unless meta.key?(:aggregate_failures)
  end

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.order = :random
  Kernel.srand config.seed
end

# Require all support files
Dir.glob('support/**/*.rb', base: __dir__).sort.each do |file|
  raise "Please remove _spec.rb from #{file}" if file.end_with?('_spec.rb')

  require file
end
