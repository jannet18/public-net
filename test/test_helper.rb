ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

# reaload all models
# Dir[Rails.root.join("test/factories/**/*.rb")].each do {|file| require file}   
Dir["#{Rails.root}/test/factories/**/*.rb"].each do |file| 
load file
end 

# FactoryBot.factories.clear
# Dir.glob("#{::Rails.root}/test/factories/*.rb").each do |file|
#   load "#{file}"
# end

# publicnet::Application.reload_routes!
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
