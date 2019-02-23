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
  #
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

  def destroy
    @rank.destroy
    redirect_to page_path(@page)
  end

  private

  def rank_params
    params.require(:rank).permit(:rating)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_rank
    @rank = Rank.find(params[:id])
  end
end
