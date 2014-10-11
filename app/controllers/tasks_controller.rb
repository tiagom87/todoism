class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :todo, :doing, :done]

  def index
    @to_do = current_user.tasks.where(state: "to_do")
    @doing = current_user.tasks.where(state: "doing")
    @done = current_user.tasks.where(state: "done")
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
    @task.destroy
    respond_to do |format|
      format.html {redirect_to tasks_path, notice: "Task Destroyed" }
    end
  end

  # Custom Methods

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

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:content, :state, :done_at)
    end
end
