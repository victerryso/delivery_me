class MessagesController < ApplicationController

  def create
    message = Message.create(:user_id => @current_user.id, :task_id => params[:task_id] ,:content => params[:content])
    render :json => message
  end
end