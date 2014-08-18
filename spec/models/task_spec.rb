# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  courier_id   :integer
#  name         :string(255)
#  description  :text
#  time         :time
#  price        :integer
#  from_address :string(255)
#  from_lat     :float
#  from_lng     :float
#  to_address   :string(255)
#  to_lat       :float
#  to_lng       :float
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Task, :type => :model do

  before do
    @task = Task.new(:name => 'The Task')
    @user = User.new(:email => 'user@email.com', :password => 'password', :password_confirmation => 'password', :name => 'User Man')
    @message = Message.new(:content => 'The Content')
    @user.tasks << @task
    @task.messages << @message
  end

  it 'should have a name' do
    expect(@task.name).to eq('The Task')
  end

  it 'should have many messages' do
    expect(@task.messages).to eq([@message])
  end

  it 'should have a user' do
    expect(@task.user).to eq(@user)
  end

end
