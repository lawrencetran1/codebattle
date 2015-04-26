class User < ActiveRecord::Base

	# Allows only 4 pages of challenges in the user show page
	paginates_per 4

	has_secure_password
	has_many :challenges

	# Checks if username exists and ignores case sensitivity
	validates :username, presence: true, uniqueness: { case_sensitive: false }

	# Checks if email exists and if email format is correct
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

	# Checks if password is between 6 and 20 characters long
	validates :password, presence: true, length: { in: 6..20 }
end
