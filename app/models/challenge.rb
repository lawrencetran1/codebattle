class Challenge < ActiveRecord::Base

	# Runs method strip_whitespace before saving to database
	before_save :strip_whitespace

	# Limit 8 challanges per page on index page
	paginates_per 8

	belongs_to :user
	validates :name, presence: true, length: { maximum: 50 }
	validates :instructions, presence: true
	validates :answer, presence: true
	validates :category, presence: true
	validates :starter, presence: true


# Strip answer of all whitespace to compare to user solution
private
  def strip_whitespace
    self.answer.gsub!(/\s+/, '')
  end

end
