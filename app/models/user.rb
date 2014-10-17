class User < ActiveRecord::Base
	before_create :set_api_token

	private
	def set_api_token
		return if api_token.present?

		begin
			self.api_token = SecureRandom.hex
		end while self.class.exists?(api_token: self.api_token)
	end
end