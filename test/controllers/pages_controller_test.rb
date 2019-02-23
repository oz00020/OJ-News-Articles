require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  # to test devise and user being logged in with IntegrationHelpers
  include Devise::Test::IntegrationHelpers

  # get page and user object and get one form fixtures
  setup do # setup is called before every test, sets a property to the page and user in the database
    @page = pages(:one)
    @user = users(:one)
  # At the start just log in the user so his signed in
    sign_in @user
  end

  # Test that we get the page home page successfully by getting route root_url and test existance of a header in the home page
  test "should get home page" do
    get root_url
    assert_select 'h4', 'Article 1'
    assert_response :success
  end

  #  test getting the page index page successfully by getting the route pages_url
    test "should get index" do
      get pages_url
      assert_response :success
    end

  # test getting the new page page successfully by getting the route new_page_url
    test "should get new" do
      get new_page_url
    end

  # test that the page  is being created successfully by posting the route pages_url with appropriate params and variable passed in @page for the specific page
    test "should create page" do
       post pages_url(@page), params: { page: { id: @page.id, user_id: @user.id, pageid: @page.pageid, title: @page.title} }
    end

  # test getting the show page  show page successfully by getting the route page_url with variable passed in @page for the specific page  show page
    test "should show page" do
      get page_url(@page)
      assert_select 'h4', 'Ranks previously given:'
      assert_response :success
    end

  # test getting the page  edit page successfully by getting the route edit_page_url with variable passed in @page to edit a specific page
    test "should get edit" do
      get edit_page_url(@page)
      assert_select 'h1', 'Edit Article'
      assert_response :success
    end

  # test the updating of a page  by path route page_url with variable passed in @page to update a specific page  after editing with all the appropriate params. After updating website gets redirected to the page show page for the specific page  that has been updated
    test "should update page " do
      patch page_url(@page), params: { page: { id: @page.id, user_id: @user.id, pageid: @page.pageid, title: @page.title } }
      assert_redirected_to page_url(@page)
    end

  # test that the specific page  is being destroyed by passing in the variable @page and the number of page s decreases by one.
  # The website gets then redirected to the main website page with all the page s
    test "should destroy page " do
      assert_difference('pages.count', 0) do
        delete page_url(@page)
      end

      assert_redirected_to root_url
    end
end
