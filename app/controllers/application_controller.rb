class ApplicationController < ActionController::Base
	# Since we're API only, we aren't dealing with sessions.
	protect_from_forgery with: :null_session

	API_TOKEN = "supersuperserial"
	before_action :authenticate, only: [ :create, :update, :destroy, :edit ]

	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			token == API_TOKEN
		end
	end

end
