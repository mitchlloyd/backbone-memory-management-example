# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Dashboard::Application.initialize!

# Work better with Backbone
ActiveRecord::Base.include_root_in_json = false
