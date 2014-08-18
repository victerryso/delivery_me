require 'rails_helper'

RSpec.describe UsersController, :type => :controller do


  describe 'GET /users/new' do
    before do
      get :new
    end

    it 'should make a new user' do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST /users' do
    before do
      post :create, { :user => {:email => 'user@email.com', :password => 'password', :password_confirmation => 'password', :name => 'User Name'} }
    end

    it 'should redirect to #index' do
      expect(response).to redirect_to root_path
    end

    it 'should increase number of users' do
      expect(User.all.length).to eq(1)
    end
  end
end
