require 'rails_helper'

RSpec.describe TasksController, :type => :controller do


  describe 'GET /tasks' do
    before do
      get :index
    end

    before do
      5.times do |i|
        Task.create(:name => Faker::Lorem.word)
      end
    end


    it 'should render the tasks index template' do
      expect(response).to render_template('index')
    end

    it 'should set an instance variable with the tasks' do
      expect(assigns(:tasks)).to be
      expect(assigns(:tasks).length).to eq(5)
      expect(assigns(:tasks).first.class).to eq(Task)
    end
  end

  describe 'POST /tasks' do
    before do
      post :create, { :task => {:name => 'Task Name'}, :from_address => '56 York St Sydney NSW' }
      @current_user = User.new
    end

    it 'should redirect to #index' do
      expect(response).to redirect_to root_path
    end

    it 'should increase number of tasks' do
      expect(Task.all.length).to eq(1)
    end
  end
end
