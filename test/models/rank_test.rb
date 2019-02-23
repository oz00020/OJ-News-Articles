require 'test_helper'

class RankTest < ActiveSupport::TestCase
  # get rank and page object and get one from fixtures
        setup do
        @rank = ranks(:one) # setup is called before every test, sets a property to the page and rank in the database
        @page = pages(:one)
        end

  # test that the page rank (rating) won't be saved without a rating
      test 'should not save empty page rank' do
        newrank = Rank.new

        newrank.save
        refute newrank.valid?
      end

  # inputting wrong data for rank(rating) won't save the rank into the database
      test 'should save valid page rank' do

        newrank = Rank.new
        newrank.page_id = @page.id
        newrank.rating = @rank.rating

        newrank.save
        refute newrank.valid?
      end
    end
