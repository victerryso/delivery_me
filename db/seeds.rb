User.destroy_all
Task.destroy_all
Message.destroy_all

u = User.create(:email => 'qwe@qwe.qwe', :password => 'qwe', :password_confirmation => 'qwe', :city => 'Sydney', :state => 'NSW', :country => 'Australia')
t = Task.create(:user_id => User.all.first, :name => 'Do Something', :description => 'Gotta get up and do something.', :price => 10, :from_address => 'Sydney Macdonald')

u.tasks << t