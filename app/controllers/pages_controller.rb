class PagesController < ApplicationController
before_action :find_page, only: [:show, :edit, :update, :destroy, :page1]

  def index
    @pages = Page.all.order("title ASC")
    file = File.read('app/assets/javascripts/article1.json')
  end

  def page1
    file = File.read('app/assets/javascripts/article1.json')
    @page1 = JSON.parse(file)
  end

  def page2
    file = File.read('app/assets/javascripts/article2.json')
    @page2 = JSON.parse(file)
  end

  def page3
    file = File.read('app/assets/javascripts/article3.json')
    @page3 = JSON.parse(file)
  end

  def page4
    file = File.read('app/assets/javascripts/article4.json')
    @page4 = JSON.parse(file)
  end

  def page5
    file = File.read('app/assets/javascripts/article5.json')
    @page5 = JSON.parse(file)
  end

  def rankingpage
  end


  def show
    if @page.title
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

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

  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end

  def find_page
    @page = Page.find_by(id:params[:id])
  end
