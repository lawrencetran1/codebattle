class Challenge < ActiveRecord::Base
	before_save :strip_whitespace

	paginates_per 8
	belongs_to :user
	validates :name, presence: true, length: { maximum: 50 }
	validates :instructions, presence: true
	validates :answer, presence: true
	validates :category, presence: true
	validates :starter, presence: true

private
  def strip_whitespace
    self.answer.gsub!(/\s+/, '')
  end

end
