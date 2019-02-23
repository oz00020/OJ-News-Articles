
class PagesController < ApplicationController

# before_action is used to run some specific methods before the execution of certain methods
before_action :find_page, only: [:show, :edit, :update, :destroy, :page1, :page2, :page3, :page4, :page5, :rankingpage, :index]
before_action :page1, :page2, :page3, :page4, :page5, only: [:show,:index]
before_action :show, only: [:average_eachpage, :page1, :page2, :page3, :page4, :page5, :rankingpage, :update_save]
before_action :average, only: [:show, :page1, :page2, :page3, :page4, :page5, :index]
before_action :average_eachpage, only: [:index, :rankingpage]
before_action :update_save, only: [:index]

# Renders the index view (website home page).
# When the index view is rendered all the pages are sorted by pageid in ascending order
  def index
    @pages = Page.all.order("pageid ASC")
  end

# If there is an existing page then the rank rating for page 1, page 2, page 3, page 4 and page 5 is updated and saved, otherwise don't do anything.
  def update_save
    if !@page.blank?
    @p1.update(params.permit(:rank_rating))
    @p1.save
    @p2.update(params.permit(:rank_rating))
    @p2.save
    @p3.update(params.permit(:rank_rating))
    @p3.save
    @p4.update(params.permit(:rank_rating))
    @p4.save
    @p5.update(params.permit(:rank_rating))
    @p5.save
  else
  end
  end

# renders the page1 view.
# read and store article 1 json file under varaible page1
# set the variable p1 to the first page
  def page1
    file = File.read('app/assets/javascripts/article1.json')
    @page1 = JSON.parse(file)
    @p1 = Page.first
  end

  # renders the page2 view.
  # read and store article 2 json file under varaible page2
  # set the variable p2 to the seond page
  def page2
    file = File.read('app/assets/javascripts/article2.json')
    @page2 = JSON.parse(file)
    @p2 = Page.second
  end

  # renders the page3 view.
  # read and store article 3 json file under varaible page3
  # set the variable p3 to the third page
  def page3
    file = File.read('app/assets/javascripts/article3.json')
    @page3 = JSON.parse(file)
    @p3 = Page.third
  end

  # renders the page4 view.
  # read and store article 4 json file under varaible page4
  # set the variable p4 to the fourth page
  def page4
    file = File.read('app/assets/javascripts/article4.json')
    @page4 = JSON.parse(file)
    @p4 = Page.fourth
  end

  # renders the page5 view.
  # read and store article 5 json file under varaible page5
  # set the variable p5 to the fifth page
  def page5
    file = File.read('app/assets/javascripts/article5.json')
    @page5 = JSON.parse(file)
    @p5 = Page.fifth
  end

# renders the rankingpage view
  def rankingpage
  end

# renders the page show view
# If there is an existing page check the pageid(Article Number) of the page else don't do anything
# if pageid is 1 then render the page1 view and set the p1 variable equal to the current page
# if pageid is 2 then render the page2 view and set the p2 variable equal to the current page
# if pageid is 3 then render the page3 view and set the p3 variable equal to the current page
# if pageid is 4 then render the page4 view and set the p4 variable equal to the current page
# if pageid is 5 then render the page5 view and set the p5 variable equal to the current page
# if pageid is not 1,2,3,4 or 5 then render the otherpages view

  def show
    if !@page.blank?
    case @page.pageid
    when 1
      render 'page1'
      @p1 = @page
    when 2
      render 'page2'
      @p2 = @page
    when 3
      render 'page3'
      @p3 = @page
    when 4
      render 'page4'
      @p4 = @page
    when 5
      render 'page5'
      @p5 = @page
    else
      render 'otherpages'
    end
  else
  end
  end

# renders the new view
# set the page variable equal to a newly created empty page under the current user
  def new
    @page = current_user.pages.build
  end

# set the page variable equal to a newly created page under the current user with all the params ented in the form
# if the page is created and saved then go to home page else render the new view again
  def create
    @page = current_user.pages.build(page_params)

    if @page.save
      redirect_to root_path
    else
      render 'new'
    end
  end

# renders the edit view
  def edit
  end

# if page updated then go back to the page updated else render the edit view again
  def update
    if @page.update(page_params)
      redirect_to page_path(@page)
    else
      render 'edit'
    end
  end

# if a page is deleted then go back to the home page
  def destroy
    @page.destroy
    redirect_to root_path
  end

# All the parameters required for a page that are added and permitted
  def page_params
    params.require(:page).permit(:title, :pageid, :rank_rating, :page_image)
  end

# check if there is an existing page
# If the existing page has no ranks set the variable average_rank (average rank of the page) to 0 else set it to the average of all it's ranks up to halve a star
  def average
    if !@page.blank?
    if @page.ranks.blank?
      @average_rank = 0
    else
      @average_rank = @page.ranks.average(:rating).round(2)
    end
  end
  end

# Firstly check if there is an existing page
# Then for each page 1,2,3,4,5 check if they have ranks and if they do then set the page rank rating attribute to the average of all their ranks rounded to a whole number
# otherwise don't do anything
  def average_eachpage

    if !@page.blank?
    if !@p1.ranks.blank?
      @p1.rank_rating = @p1.ranks.average(:rating).round(0)
    end

    if !@p2.ranks.blank?
      @p2.rank_rating = @p2.ranks.average(:rating).round(0)
    end

    if !@p3.ranks.blank?
      @p3.rank_rating = @p3.ranks.average(:rating).round(0)
    end

    if !@p4.ranks.blank?
      @p4.rank_rating = @p4.ranks.average(:rating).round(0)
    end

    if !@p5.ranks.blank?
      @p5.rank_rating = @p5.ranks.average(:rating).round(0)
    end
  else
  end
  end

# Find a page by their unique id from the db records and store it under the variable page
# set the p1 variable equal to the first page
# set the p2 variable equal to the second page
# set the p3 variable equal to the third page
# set the p4 variable equal to the fourth page
# set the p5 variable equal to the fifth page
  def find_page
    @page = Page.find_by(id:params[:id])
    @p1 = Page.first
    @p2 = Page.second
    @p3 = Page.third
    @p4 = Page.fourth
    @p5 = Page.fifth
  end
end
