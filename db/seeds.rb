User.destroy_all
Task.destroy_all
Message.destroy_all

u = User.create(:email => 'qwe@qwe.qwe', :password => 'qwe', :password_confirmation => 'qwe', :address => 'Sydney NSW Australia')
t = Task.new(:user_id => User.all.first, :name => 'Do Something', :description => 'Gotta get up and do something.', :price => 10, :from_name => 'Macquaire Group Sydney', :from_address => 'Macquaire Group Sydney NSW', :to_name => 'General Assembly', :to_address => '56 York St Sydney NSW')
m1 = Message.new(:content => 'Hello')
m2 = Message.new(:content => 'How are you?')
t.save
u.tasks << t

u.messages << m1
t.messages << m1

u.messages << m2
t.messages << m2