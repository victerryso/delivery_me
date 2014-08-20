User.destroy_all
Task.destroy_all
Message.destroy_all

u1 = User.create(:email => 'qwe@qwe.qwe', :password => 'qwe', :password_confirmation => 'qwe', :name => 'Snorlax', :image => 'http://cdn.meme.li/images/300x/574526.jpg', :address => 'Sydney NSW Australia')
u2 = User.create(:email => 'asd@asd.asd', :password => 'asd', :password_confirmation => 'asd', :name => 'Groot', :image => 'http://radtitan.files.wordpress.com/2014/06/wp_20140622_003-001.jpg', :address => 'Melbourne NSW Australia')


t1 = Task.new(:user_id => User.all.last, :name => 'Bring me chicken wings', :description => 'Kentucky Fried Chicken and a Pizza Hut. Macdonalds... Macdonalds...', :price => 10, :from_name => 'KFC', :from_address => '428 George St Sydney NSW', :to_name => 'The Rocks', :to_address => 'Chinatown Sydney NSW')
t2 = Task.new(:user_id => User.all.first, :name => 'Find Rira', :description => 'Missing girl. Last seen in Macq Building. Please return to GA.', :price => 20, :from_name => 'Macquaire Group Sydney', :from_address => '1 Martin Pl Sydney NSW', :to_name => 'General Assembly', :to_address => '56 York St Sydney NSW')

m1 = Message.new(:content => 'Hello?')
m2 = Message.new(:content => 'I don\'t know who you are but I will find you and I will eat you.')

u1.tasks << t1
u2.tasks << t2

u1.messages << m1
t1.messages << m1

u1.messages << m2
t1.messages << m2
