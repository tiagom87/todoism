class Board < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	has_many :board_members, dependent: :destroy
	belongs_to :user
	has_many :users, through: :board_members
end