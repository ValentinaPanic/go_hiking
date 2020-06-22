require_relative './go_hiking/version.rb'
require "pry"
require "httparty"
# require "open-uri"
# require "json"
require_relative "./api_manager"
require_relative "./hike"
require_relative "./cli"



module GoHiking
  class Error < StandardError; end
  # Your code goes here...
end
