class User < ActiveRecord::Base
	before_save { |user| user.username = username.downcase }
  	before_save :create_remember_token
  	has_many :orders
 		
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
