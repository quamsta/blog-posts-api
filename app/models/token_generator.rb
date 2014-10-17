class TokenGenerator < ActiveRecord::Base
	def create
		loop do
			self.api_token = SecureRandom.hex
			break self.api_token unless User.exists?(api_token: token)
		end
	end
end
