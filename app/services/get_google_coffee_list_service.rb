require 'rest-client'
require 'json'

class GetGoogleCoffeeListService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def call
    begin
      query           = 'church'
      radius          = '5'
      google_api_key  = Rails.application.credentials.google_secret_key
      base_url        = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{query}&location=-#{@latitude},#{@longitude}&radius=#{radius}&key=#{google_api_key}"
      response        = RestClient.get base_url
      
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end