require 'open-uri'
require 'JSON'
require 'http'
require "pry"
module SkinCare

  class API

    API_HOST = "https://api.yelp.com" #the base
    SEARCH_PATH = "/v3/businesses/search" #endpoint
    BUSINESS_PATH = "/v3/businesses/"  # endpoint/we append the business id to the path
              
    def self.api_key 

      begin 
        @@key = File.open(File.expand_path("~/.yelp-key")).read.strip 
      rescue
        puts "OOops! Seems like you haven't added your Yelp API key yet!  
        You can sign up for one by following these instructions: https://ultimateelementor.com/docs/get-yelp-api-key/.  
        Once you are done, come back and paste your key in here:"
        @@key = gets.strip 
        return if @@key == "exit"

        File.open(File.expand_path("~/.yelp-key"), "w") do |file| 
          file.print @@key 
        end 
      end 
      @@key 
    end

    def self.yelp_search(term, location)
      url = "#{API_HOST}#{SEARCH_PATH}"
      params = {
      term: term,
      location: location
      }
            
      response = HTTP.auth("Bearer #{api_key}").get(url, params: params)
      response.parse["businesses"] # JSON.parse(response)["businesses"]
    end
  end 

end
  