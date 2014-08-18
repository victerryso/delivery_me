# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  name            :string(255)      default("Someone")
#  image           :text             default("http://www.fedical.com/wp-content/uploads/2014/04/Happy-face-coloring-pages.jpg")
#  credibility     :integer          default(0)
#  city            :string(255)
#  state           :string(255)
#  country         :string(255)
#  latitude        :float
#  longitude       :float
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe User, :type => :model do

  before do
    @task = Task.new(:name => 'The Task')
    @user = User.new(:email => 'user@email.com', :password => 'password', :password_confirmation => 'password', :name => 'User Man')
    @message = Message.new(:content => 'The Content')
    @user.tasks << @task
    @user.messages << @message
  end

  it 'should have a email' do
    expect(@user.email).to eq('user@email.com')
  end

  it 'should have many tasks' do
    expect(@user.tasks).to eq([@task])
  end

  it 'should have many messages' do
    expect(@user.messages).to eq([@message])
  end

end
