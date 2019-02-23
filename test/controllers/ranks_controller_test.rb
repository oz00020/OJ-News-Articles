require 'test_helper'

class RanksControllerTest < ActionDispatch::IntegrationTest

  # to test devise and user being logged in with IntegrationHelpers
  include Devise::Test::IntegrationHelpers

  # get user/car/page object and get one form fixtures
      setup do
        @rank = ranks(:one) # setup is called before every test, sets a property to the page, car and rank in the database
        @page = pages(:one)
        # At the start just log in the user so his signed in
        @user = users(:one)
        sign_in @user
      end

  # test that we successfully display the rank new form by getting the route new_page_rank_url with the variable passed in @sucar to create a rank for a specific page
        test "should get new" do
        get new_page_rank_url(@page)
         assert_response :success
        end

  # test the creation of a rank by posting the url page_rank_url with variable @page passed in to create a rating for a specific page. Appropriate params of rank are provided and the website gets redirected back to the page show view.
        test "should create rank" do
          # assert_difference('rank.count') do
            post page_ranks_url(@page), params: { rank: { id: @rank.id, page_id: @page.id, rating: @rank.rating } }
            assert_response :redirect
        end

  # test that the rank (rating) is being destroyed by deleting route page_rank_url with variables @page and @rank passed in to delete a specific rank created by a specific user.
  #  The ranks (ratings) count should decrease by 1 after removal of the rank and the website should be redirected back to the page show view.
        test "should destroy rank" do
          assert_difference('Rank.count', -1) do
            delete page_rank_url(@page,@rank)
          end

          assert_response :redirect
        end
  end
