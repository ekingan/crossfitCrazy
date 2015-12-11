class User < ActiveRecord::Base

	has_many :reviews
  has_secure_password


	BCrypt::Engine.cost = 12

	validates :username, :password_digest, presence: true
	validates_confirmation_of :password_digest
	validates :email, presence: true, uniqueness: true

	def authenticate(unencrypted_password)
		secure_password = BCrypt::Password.new(self.password_digest)

		if secure_password == unencrypted_password
			#return user
			self
		else
			false
		end
	end

	def password=(unencrypted_password)
		#raise scope of password to instance
		@password = unencrypted_password
		self.password_digest = BCrypt::Password.create(@password)
	end

	def password
		@password
	end

	def self.confirm(email_param, password_param)
		#add unique email validator
		user = User.find_by_email(email_param)
		user.authenticate(password_param)
	end

	
end
