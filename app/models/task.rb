class Task < ActiveRecord::Base
	belongs_to :board
	validates :board_id, presence: true
	validates :content, presence: true
end