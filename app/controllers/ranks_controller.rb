class RanksController < ApplicationController

# before_action is used to run some specific methods before the execution of certain methods
  before_action :find_page
  before_action :find_rank, only: [:destroy]

  # renders the new view in the rank views
  # set the rank variable equal to a newly created empty rank under the current user
  def new
    @rank = Rank.new
  end

  # set the rank variable equal to a newly created rank under the current user with all the params ented in the form
  # if the user is signed in then create the rank under the current user
  # if the rank is created and saved then go to rankingpage view else render ask user to login first
  def create
    @rank = Rank.new(rank_params)
    @rank.page_id = @page.id

    @rank.user_id = current_user.id if user_signed_in?

    if @rank.save
      redirect_to rankingpage_path
    else
      redirect_to new_user_session_path
    end
  end

# If a rank of a page is deleted then go to the ranking page
  def destroy
    @rank.destroy
    redirect_to rankingpage_path
  end

# private methods
  private

# All the parameters required for a rank that are required, added and permitted
  def rank_params
    params.require(:rank).permit(:rating)
  end

# Find a page by its unique id page_id from the db records and store it under the variable page
  def find_page
    @page = Page.find(params[:page_id])
  end

# Find a rank by its unique id from the db records and store it under the variable rank
  def find_rank
    @rank = Rank.find(params[:id])
  end
end
