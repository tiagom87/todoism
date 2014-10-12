class BoardsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_board, only: [:show, :edit, :update, :unarchive, :destroy]
	
	def index
		@board = Board.new
			@boards = current_user.boards.where(archived_at: nil)
			respond_to do |format|
				format.html
			end
	end

	def show
		@to_do = @board.tasks.where(state: "to_do").where(archived_at: nil)
		@doing = @board.tasks.where(state: "doing").where(archived_at: nil)
		@done = @board.tasks.where(state: "done").where(archived_at: nil)
		@task = Task.new
		respond_to do |format|
			format.html
		end
	end

	def create
		@board = current_user.boards.new(board_params)
		@board.save
		respond_to do |format|
			format.html {redirect_to boards_path, notice: "Board Created" }
		end
	end

	def edit
	end

	def update
		@board.update(board_params)
		respond_to do |format|
			format.html {redirect_to boards_path, notice: "Board Updated" }
		end
	end

	def destroy
		@board.update_attributes(archived_at: Time.zone.now)
		respond_to do |format|
			format.html {redirect_to boards_path, notice: "Board Archived" }
		end
	end

	def unarchive
		@board.update_attributes(archived_at: nil)
		respond_to do |format|
			format.html {redirect_to boards_path, notice: "Board Unarchived" }
		end
	end

	def archived
		@archived_boards = current_user.boards.where.not(archived_at: nil)
	end

	private

	def set_board
		@board = Board.find(params[:id])
	end

	def board_params
		params.require(:board).permit(:name, :board_id)
	end
end