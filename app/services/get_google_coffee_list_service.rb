require 'rest-client'
require 'json'

class GetGoogleCoffeeListService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def call
    begin
      base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=-#{@latitude},#{@longitude}&radius=5000&key=AIzaSyBeSWZZizCsSon8eaoDXfx8yzb7YEa3Zpc"
      response = RestClient.get base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end