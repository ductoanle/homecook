require 'braintree_plans_fetcher'

namespace :braintree do
  desc 'Import plans from Braintree'
  task :import_plans => :environment do
    BraintreePlanFetcher.store_locally
  end
end
