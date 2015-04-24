class Challenge < ActiveRecord::Base
	paginates_per 8
	belongs_to :user
	validates :name, presence: true, length: { maximum: 50 }
	validates :instructions, presence: true
	validates :example, presence: true
	validates :category, presence: true
end
