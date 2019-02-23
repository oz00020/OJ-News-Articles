#delete exisiting records
Page.delete_all
User.delete_all

user = User.create! :email => 'test@test.com', :password => '123456', :password_confirmation => '123456'

#add the pages we need
Page.create!(:pageid => 1, :title => "Article 1", :user_id => user.id)
Page.create!(:pageid => 2, :title => "Article 2", :user_id => user.id)
Page.create!(:pageid => 3, :title => "Article 3", :user_id => user.id)
Page.create!(:pageid => 4, :title => "Article 4", :user_id => user.id)
Page.create!(:pageid => 5, :title => "Article 5", :user_id => user.id)
