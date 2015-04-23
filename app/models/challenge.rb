class Challenge < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true, length: { maximum: 32 }
	validates :instructions, presence: true
	validates :example, presence: true
	validates :category, presence: true
end
