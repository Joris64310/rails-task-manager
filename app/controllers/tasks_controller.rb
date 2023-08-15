class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # As a user, i can see all tasks (index)
  def index
    @tasks = Task.all
  end

  # As a user, i can see one restaurant (show)
  def show
  end

  # As a user, i can create a restaurant (new, create)
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  # As a user, i can update a task (edit, update)
  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  # As a user, i can destroy a task (destroy)
  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  # Set task for all actions in before action filter
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
