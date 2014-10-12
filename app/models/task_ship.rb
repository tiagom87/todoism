class TaskShip < ActiveRecord::Base
	belongs_to :task
	belongs_to :board_member
end
