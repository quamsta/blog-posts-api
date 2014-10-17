class ApplicationController < ActionController::Base
	# Since we're API only, we aren't dealing with sessions.
	protect_from_forgery with: :null_session
end
