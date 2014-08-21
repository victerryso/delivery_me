User.destroy_all
Task.destroy_all
Message.destroy_all

u1 = User.create(:email => 'qwe@qwe.qwe', :password => 'qwe', :password_confirmation => 'qwe', :name => 'Snorlax', :image => 'http://cdn.meme.li/images/300x/574526.jpg', :address => 'Sydney NSW Australia')
u2 = User.create(:email => 'asd@asd.asd', :password => 'asd', :password_confirmation => 'asd', :name => 'Groot', :image => 'http://radtitan.files.wordpress.com/2014/06/wp_20140622_003-001.jpg', :address => 'Melbourne VIC Australia')
u3 = User.create(:email => 'zxc@zxc.zxc', :password => 'zxc', :password_confirmation => 'zxc', :name => 'Fish', :image => 'http://i1.kym-cdn.com/photos/images/newsfeed/000/082/456/Okay.png', :address => 'Cabramatta NSW Australia')


t1 = Task.new(:name => 'Bring me some chicken wings', :description => 'Kentucky Fried Chicken and a Pizza Hut. Macdonalds... Macdonalds...', :price => 10, :from_name => 'KFC', :from_address => '428 George St Sydney NSW', :to_name => 'The Rocks', :to_address => 'Chinatown Sydney NSW')
t2 = Task.new(:name => 'Find Rira', :description => 'Missing girl. Last seen in Macq Building. Please return to GA.', :price => 20, :from_name => 'Macquaire Group Sydney', :from_address => '1 Martin Pl Sydney NSW', :to_name => 'General Assembly', :to_address => '56 York St Sydney NSW')
t3 = Task.new(:name => 'Porkroll Run', :description => 'Can someone grab me a porkroll?', :price => 5, :from_name => 'Pork Roll Store', :from_address => '100 John St Cabramatta NSW', :to_name => 'Home', :to_address => 'Cabramatta NSW Australia')

m1 = Message.new(:content => 'Hello?')
m2 = Message.new(:content => 'I don\'t know who you are but I will find you and I will eat you.')
m3 = Message.new(:content => 'Grab me one too')

u1.tasks << t1
u2.tasks << t2
u3.tasks << t3

u1.messages << m1
t2.messages << m1

u1.messages << m2
t2.messages << m2

u1.messages << m3
t3.messages << m3