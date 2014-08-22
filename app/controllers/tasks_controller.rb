class TasksController < ApplicationController

  before_action :set_task, only: [:show, :courier]

  def index
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
    @task = Task.create task_params
    # @current_user.tasks << @task
    render :json => @task
  end

  def show
    @messages = Message.where(:task_id => params[:id])
    json = {'task' => @task.as_json(:include => :user), 'messages' => @messages.as_json(:include => :user)}
    render :json => json
  end

  def courier
    @task.courier_id = @current_user.id
    @task.save
    render :json => @task
  end

  def search
    search = params[:search]
    p search.gsub!(/ /, '+')
    location = "#{@current_user.latitude},#{@current_user.longitude}"
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + location + "&radius=10000&keyword=" + search +"&key=AIzaSyC62HHql2ZcJv7RsliQ1MKf1XQMgK-_esY"
    response = HTTParty.get(url)
    render :json => response['results']
  end

  private

  def set_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:user_id, :courier_id, :name, :description, :time, :price, :from_name, :from_address, :to_name, :to_address)
  end


end