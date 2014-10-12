class BoardMember < ActiveRecord::Base
	belongs_to :user
	belongs_to :board
	has_many :task_ships, dependent: :destroy

	attr_reader :name
	attr_reader :initials

	def name
		user = User.find(self.user_id)
		user.full_name + " (" + user.email + ")"
	end

	def initials
		user = User.find(self.user_id)
    	(user.first_name[0] + user.last_name[0]).upcase
  	end
end
