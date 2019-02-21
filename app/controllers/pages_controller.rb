
class PagesController < ApplicationController

before_action :find_page, only: [:show, :edit, :update, :destroy, :page1, :page2, :pag3, :page4, :page5, :rankingpage, :index]
before_action :page1, :page2, :page3, :page4, :page5, only: [:show]
before_action :show, only: [:page1, :page2, :page3, :page4, :page5]
before_action :average, only: [:show, :page1, :page2, :pag3, :page4, :page5]
before_action :average1, only: [:index, :rankingpage]

  def index
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
    @pages = Page.all.order("rank_rating ASC")
  end

  def page1
    file = File.read('app/assets/javascripts/article1.json')
    @page1 = JSON.parse(file)
    @p2 = Page.second
  end

  def page2
    file = File.read('app/assets/javascripts/article2.json')
    @page2 = JSON.parse(file)
    @p3 = Page.third
  end

  def page3
    file = File.read('app/assets/javascripts/article3.json')
    @page3 = JSON.parse(file)
    @p4 = Page.fourth
  end

  def page4
    file = File.read('app/assets/javascripts/article4.json')
    @page4 = JSON.parse(file)
    @p5 = Page.fifth
  end

  def page5
    file = File.read('app/assets/javascripts/article5.json')
    @page5 = JSON.parse(file)
  end

  def rankingpage
  end


  def show
    case @page.pageid
    when 1
      render 'page1'
    when 2
      render 'page2'
    when 3
      render 'page3'
    when 4
      render 'page4'
    when 5
      render 'page5'
    else
    end
  end

  def new
    @page = current_user.pages.build
  end

  def create
    @page = current_user.pages.build(page_params)

    if @page.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to page_path(@page)
    else
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to root_path
  end

  def page_params
    params.require(:page).permit(:title, :pageid, :rank_rating, :page_image)
  end

  def average
    if @page.ranks.blank?
      @average_rank = 0
    else
      @average_rank = @page.ranks.average(:rating).round(2)
    end
  end

  def average1
    @p1.rank_rating = @p1.ranks.average(:rating).round(2)
    @p2.rank_rating = @p2.ranks.average(:rating).round(2)
    @p3.rank_rating = @p3.ranks.average(:rating).round(2)
    @p4.rank_rating = @p4.ranks.average(:rating).round(2)
    @p5.rank_rating = @p5.ranks.average(:rating).round(2)
  end

  def find_page
    @page = Page.find_by(id:params[:id])
    @p1 = Page.first
    @p2 = Page.second
    @p3 = Page.third
    @p4 = Page.fourth
    @p5 = Page.fifth
  end
end
