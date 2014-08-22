User.destroy_all
Task.destroy_all
Message.destroy_all

u1 = User.create(:email => 'qwe@qwe.qwe', :password => 'qwe', :password_confirmation => 'qwe', :name => 'Snorlax', :image => 'http://cdn.meme.li/images/300x/574526.jpg', :address => 'Sydney NSW Australia')
u2 = User.create(:email => 'asd@asd.asd', :password => 'asd', :password_confirmation => 'asd', :name => 'Groot', :image => 'http://radtitan.files.wordpress.com/2014/06/wp_20140622_003-001.jpg', :address => 'Melbourne VIC Australia')
u3 = User.create(:email => 'zxc@zxc.zxc', :password => 'zxc', :password_confirmation => 'zxc', :name => 'Fish', :image => 'http://i1.kym-cdn.com/photos/images/newsfeed/000/082/456/Okay.png', :address => 'Cabramatta NSW Australia')
u4 = User.create(:email => 'wer@wer.wer', :password => 'wer', :password_confirmation => 'wer', :name => 'Fish', :image => 'http://4.bp.blogspot.com/-6KIaaGtuel0/UUgjgdN-B7I/AAAAAAAAFUo/daG47b-sLNw/s1600/funny+fat+kid67.jpg', :address => 'Sydney NSW Australia')
u5 = User.create(:email => 'ert@ert.ert', :password => 'ert', :password_confirmation => 'ert', :name => 'Fish', :image => 'http://hilarioustime.com/images/03/Give-me-more-food-funny-fat-Asian-kid.jpg', :address => 'Sydney NSW Australia')
u6 = User.create(:email => 'rty@rty.rty', :password => 'rty', :password_confirmation => 'rty', :name => 'Fish', :image => 'http://7tattoo.files.wordpress.com/2010/03/daily_16.jpg', :address => 'Sydney NSW Australia')
u7 = User.create(:email => 'tyu@tyu.tyu', :password => 'tyu', :password_confirmation => 'tyu', :name => 'Fish', :image => 'http://www.chinasmack.com/wp-content/uploads/2011/04/xiao-hao-chinese-4-year-old-fatty-boy-62kg-09-chicken-wing-560x769.jpg', :address => 'Sydney NSW Australia')
u8 = User.create(:email => 'yui@yui.yui', :password => 'yui', :password_confirmation => 'yui', :name => 'Fish', :image => 'http://manolobig.com/wordpress/wp-content/uploads/2012/10/haters-gonna-hate-fat-chinese-kid.jpg', :address => 'Sydney NSW Australia')
u9 = User.create(:email => 'uio@uio.uio', :password => 'uio', :password_confirmation => 'uio', :name => 'Fish', :image => 'http://i445.photobucket.com/albums/qq180/shilex12/walmart.jpg', :address => 'Sydney NSW Australia')
u10 = User.create(:email => 'iop@iop.iop', :password => 'iop', :password_confirmation => 'iop', :name => 'Fish', :image => 'http://i.dailymail.co.uk/i/pix/2011/03/22/article-1368772-0B480CDE00000578-770_634x433.jpg', :address => 'Sydney NSW Australia')


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
u4.tasks << t4
u5.tasks << t5
u6.tasks << t6
u7.tasks << t7
u8.tasks << t8
u9.tasks << t9
u10.tasks << t10

u1.messages << m1
t2.messages << m1

u1.messages << m2
t2.messages << m2

u1.messages << m3
t3.messages << m3