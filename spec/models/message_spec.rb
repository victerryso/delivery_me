# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Message, :type => :model do

  before do
    @task = Task.new(:name => 'The Task')
    @user = User.new(:email => 'user@email.com', :password => 'password', :password_confirmation => 'password', :name => 'User Man')
    @message = Message.new(:content => 'The Content')
    @task.messages << @message
    @user.messages << @message
  end

  it 'should have content' do
    expect(@message.content).to eq('The Content')
  end

  it 'should belong to task' do
    expect(@message.task).to eq(@task)
  end

  it 'should belong to user' do
    expect(@message.user).to eq(@user)
  end

end