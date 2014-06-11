class ForecastController < ApplicationController

	def index

		require 'forecast_io'
		require 'typhoeus/adapters/faraday'

		ForecastIO.api_key = '545bc8ee1ee9907df971316c7968014a'

		@forecast = ForecastIO.forecast(37.8267, -122.423)

		# @forecast = ForecastIO.forecast(37.8267, -122.423, time: Time.now

	end

end