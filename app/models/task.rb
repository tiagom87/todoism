class Task < ActiveRecord::Base
	belongs_to :board
	validates :board_id, presence: true
	validates :content, presence: true
	has_many :task_ships, dependent: :destroy
  	has_many :board_members, through: :task_ships
end