class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :todo, :doing, :done, :unarchive]

  def index
    @to_do = current_user.tasks.where(state: "to_do").where(archived_at: nil)
    @doing = current_user.tasks.where(state: "doing").where(archived_at: nil)
    @done = current_user.tasks.where(state: "done").where(archived_at: nil)
    @task = Task.new
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.save
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Created" }
    end
  end

  def update
    @task.update(task_params)
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Updated" }
    end
  end

  def destroy
    @task.update_attributes(archived_at: Time.zone.now)
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Archived" }
    end
  end

  # Custom Actions begin

  def doing
    @task.update_attributes(state: "doing")
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Updated" }
    end
  end

  def done
    @task.update_attributes(state: "done")
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Updated" }
    end
  end

  def todo
    @task.update_attributes(state: "to_do")
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Updated" }
    end
  end

  def archived
    @archived_tasks = current_user.tasks.where.not(archived_at: nil)
  end

  def unarchive
   @task.update_attributes(archived_at: nil)
    respond_to do |format|
      format.html {redirect_to archived_path, notice: "Task Unarchived" }
    end
  end

  # Custom Actions End

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:content, :state, :done_at)
    end
end
