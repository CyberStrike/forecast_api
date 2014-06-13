class ForecastController < ApplicationController

	require 'forecast_io'
	require 'typhoeus/adapters/faraday'
	require 'geocoder'

	def index

		# city = request.location	
		userSearch = params[:q]

		if userSearch.blank?
	 		# the geocoder is searching for city
	 		@geocoder = request.location
	 	else
	 		@geocoder = Geocoder.search(userSearch).first
	 	end

	 	unless @geocoder.blank?

	 		lat = @geocoder.latitude # lat = geocoder[0].geometry["location"]["lat"]

	 		lng = @geocoder.longitude # lng = geocoder[0].geometry["location"]["lng"]

	 		ForecastIO.api_key = '545bc8ee1ee9907df971316c7968014a'

	 		@forecast = ForecastIO.forecast(lat, lng)
	 	end
	 end

end