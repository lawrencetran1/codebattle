class Challenge < ActiveRecord::Base
	belongs_to :user
	# validates :user_id, presence: true
	# validates :name, presence: true
	# validates :instructions, presence: true
	# validates :example, presence: true
	# validates :category, presence: true
end
