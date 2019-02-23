require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # get user object and get one form fixtures
    setup do
     @user = users(:one) # setup is called before every test, sets a property to the page in the database
    end

  # test that a page pageid won't be save without a page pageid
    test 'should not save empty page pageid' do
      newpage = Page.new
      newpage.title = 'A1'
      newpage.save
      refute newpage.valid?
    end

  # test that the page pageid will be successfully saved after inputting the correct data required.
    test 'should save valid page pageid' do
      newpage = Page.new
      newpage.user_id = @user.id
      newpage.title = 'A1'
      newpage.pageid = 1
      newpage.save
      assert newpage.valid?
    end

    # test that the page pageid won't save with a duplipagee page pageid name
    test 'should save duplicate page pageid' do
      oldpage = Page.new
      oldpage.user_id = @user.id
      oldpage.title = 'A1'
      oldpage.pageid = 1
      oldpage.save
      assert oldpage.valid? # test assert(true) means true and should be valid

      newpage = Page.new
      newpage.user_id = @user.id
      newpage.title = 'A1'
      newpage.pageid = 1
      newpage.save
      assert newpage.valid? # refute(falses) means not true so not valid
    end

end
