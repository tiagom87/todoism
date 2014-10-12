class Board < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	has_many :board_members, dependent: :destroy
	belongs_to :user
	has_many :users, through: :board_members
	after_create :add_owner_as_board_member

	def add_owner_as_board_member
		self.board_members.create(user_id: self.user_id)
	end
end