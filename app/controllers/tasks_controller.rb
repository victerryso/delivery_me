class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
    @task = Task.create task_params
    @current_user.tasks << @task
    render :json => @task
  end

  def show
    @task = Task.find params[:id]
    render :json => @task
  end

  private

  def set_task
    # @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:user_id, :courier_id, :name, :description, :time, :price, :from_address, :to_address)
  end


end