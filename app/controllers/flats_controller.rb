require "open-uri"

class FlatsController < ApplicationController
  FLATS_URL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json".freeze

  before_action :set_flats

  def index # READ all
    # 1. Fetch the flats from the url
    @flats = set_flats
  end

  def show # READ one
    # params = { id: 145 }
    # 1. Fetch the flat with specific id
    @flat = @flats.find {|flat| flat["id"] == params[:id].to_i }
  end

  private

  def set_flats
    json = open(FLATS_URL).read
    @flats = JSON.parse(json) # => returns a ruby hash
  end
end
