class BoardMembersController < ApplicationController
	before_action :set_board, only: [:create, :destroy]

	def create
		@board_member = @board.board_members.new(board_member_params)
		@board_member.save
		respond_to do |format|
			format.html {redirect_to board_path(@board), notice: "Member Added" }
		end
	end
	
	def accept
	end

	def destroy
		@board_member = BoardMember.find(params[:id])
		@board_member.destroy
		respond_to do |format|
			format.html {redirect_to board_path(@board), notice: "Member Removed" }
		end
	end

	private

    def set_board
      @board = Board.find(params[:board_id])
    end

    def board_member_params
      params.require(:board_member).permit(:user_id)
    end
end