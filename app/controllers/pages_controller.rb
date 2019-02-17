class PagesController < ApplicationController
before_action :find_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all.order("pageid ASC")
  end

  def page1
  end

  def page2
  end

  def page3
  end

  def page4
  end

  def page5
  end

  def rankingpage
  end

  def new
    @page = Page.new
  end

  def show
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :pageid)
  end

  def find_page
    @page = Page.find(params[:pageid])
  end
end
