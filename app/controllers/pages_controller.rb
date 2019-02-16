class PagesController < ApplicationController

  def index
    @pages = Page.all.order("make ASC")
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

  def create
    @page = Page.new(page_params)
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :pageid, :category)
  end

end
