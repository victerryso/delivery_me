User.destroy_all
Task.destroy_all
Message.destroy_all

u1 = User.create(:email => 'qwe@qwe.qwe', :password => 'qwe', :password_confirmation => 'qwe', :name => 'Snorlax', :image => 'http://cdn.meme.li/images/300x/574526.jpg', :address => 'Sydney NSW Australia')
u2 = User.create(:email => 'asd@asd.asd', :password => 'asd', :password_confirmation => 'asd', :name => 'Groot', :image => 'http://radtitan.files.wordpress.com/2014/06/wp_20140622_003-001.jpg', :address => 'Melbourne VIC Australia')
u3 = User.create(:email => 'zxc@zxc.zxc', :password => 'zxc', :password_confirmation => 'zxc', :name => 'Fish', :image => 'http://i1.kym-cdn.com/photos/images/newsfeed/000/082/456/Okay.png', :address => 'Cabramatta NSW Australia')


t1 = Task.new(:name => 'Bring me some chicken wings', :description => 'Kentucky Fried Chicken and a Pizza Hut. Macdonalds... Macdonalds...', :price => 10, :from_name => 'KFC', :from_address => '428 George St Sydney NSW', :to_name => 'The Rocks', :to_address => 'Chinatown Sydney NSW')
t2 = Task.new(:name => 'Find Rira', :description => 'Missing girl. Last seen in Macq Building. Please return to GA.', :price => 20, :from_name => 'Macquaire Group Sydney', :from_address => '1 Martin Pl Sydney NSW', :to_name => 'General Assembly', :to_address => '56 York St Sydney NSW')
t3 = Task.new(:name => 'Porkroll Run', :description => 'Can someone grab me a porkroll?', :price => 5, :from_name => 'Pork Roll Store', :from_address => '100 John St Cabramatta NSW', :to_name => 'Home', :to_address => 'Cabramatta NSW Australia')
t4 = Task.new(:name => 'Maccas Run', :description => 'Can someone grab me a happy meal??', :price => 10, :from_name => 'Macdonalds', :from_address => 'Wynyard Sydney NSW', :to_name => 'Home', :to_address => 'Sydney NSW Australia')
t5 = Task.new(:name => 'Grab me fish?', :description => 'Can someone grab me fish from the fish market?', :price => 15, :from_name => 'Fish Market', :from_address => 'Fish Market Pyrmont Sydney NSW', :to_name => 'Home', :to_address => 'Sydney NSW Australia')
t6 = Task.new(:name => 'Chinese delivery', :description => 'Can someone grab me dumplings?', :price => 15, :from_name => 'Din Tai Fung', :from_address => 'World Square Sydney NSW', :to_name => 'Home', :to_address => 'Sydney NSW Australia')
t7 = Task.new(:name => 'Takoyaki Please', :description => 'Can someone grab me a octopus balls?', :price => 5, :from_name => 'Kura', :from_address => 'Chinatown Sydney NSW', :to_name => 'Home', :to_address => 'Sydney NSW Australia')
t8 = Task.new(:name => 'Pizza run!', :description => 'Can someone grab me a supreme pizza?', :price => 5, :from_name => 'Made In Italy', :from_address => 'Pyrmont Sydney NSW', :to_name => 'Home', :to_address => 'Sydney NSW Australia')
t9 = Task.new(:name => 'KFC', :description => 'Can someone grab me a bucket of wings?', :price => 5, :from_name => 'KFC ', :from_address => 'Townhall Sydney NSW', :to_name => 'Home', :to_address => 'Sydney NSW Australia')
t10 = Task.new(:name => '6 Chicken Nuggets', :description => 'Can someone grab me some nuggets?', :price => 10, :from_name => 'Macds', :from_address => 'Central Sydney NSW', :to_name => 'Home', :to_address => 'Sydney NSW Australia')

m1 = Message.new(:content => 'Hello?')
m2 = Message.new(:content => 'I don\'t know who you are but I will find you and I will eat you.')
m3 = Message.new(:content => 'Grab me one too')

u1.tasks << t1
u2.tasks << t2
u3.tasks << t3
u1.tasks << t4
u1.tasks << t5
u1.tasks << t6
u1.tasks << t7
u1.tasks << t8
u1.tasks << t9
u1.tasks << t10

u1.messages << m1
t2.messages << m1

u1.messages << m2
t2.messages << m2

u1.messages << m3
t3.messages << m3