class User < ActiveRecord::Base
	has_secure_password
	has_many :challenges
	validates :username, presence: true, uniqueness: { case_sensitive: false }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, presence: true, length: { in: 6..20 }
end
