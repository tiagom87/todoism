class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy, :todo, :doing, :done, :unarchive]
  before_action :set_board, only: [:create, :archived]

  def new
    @task = Task.new
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @task = @board.tasks.new(task_params)
    @task.save
    respond_to do |format|
      format.html {redirect_to board_path(@board), notice: "Task Created" }
    end
  end

  def update
    @task.update(task_params)
    respond_to do |format|
      format.html {redirect_to board_path(@task.board), notice: "Task Updated" }
    end
  end

  def destroy
    @task.update_attributes(archived_at: Time.zone.now)
    respond_to do |format|
      format.html {redirect_to board_path(@task.board), notice: "Task Archived" }
    end
  end

  # Custom Actions begin

  def doing
    @task.update_attributes(state: "doing")
    respond_to do |format|
      format.html {redirect_to board_path(@task.board), notice: "Task Updated" }
    end
  end

  def done
    @task.update_attributes(state: "done")
    respond_to do |format|
      format.html {redirect_to board_path(@task.board), notice: "Task Updated" }
    end
  end

  def todo
    @task.update_attributes(state: "to_do")
    respond_to do |format|
      format.html {redirect_to board_path(@task.board), notice: "Task Updated" }
    end
  end

  def unarchive
   @task.update_attributes(archived_at: nil)
    respond_to do |format|
      format.html {redirect_to board_path(@task.board), notice: "Task Unarchived" }
    end
  end

  def archived
    @board = Board.find(params[:board_id])
    @archived_tasks = @board.tasks.where.not(archived_at: nil)
  end

  # Custom Actions End

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    def task_params
      params.require(:task).permit(:content, :state, :done_at, :board_member_ids => [])
    end
end
