#delete exisiting records
Page.delete_all

#add the pages we need
Page.create!(:pageid => 1, :title => "Article 1")
Page.create!(:pageid => 2, :title => "Article 2")
Page.create!(:pageid => 3, :title => "Article 3")
Page.create!(:pageid => 4, :title => "Article 4")
Page.create!(:pageid => 5, :title => "Article 5")
