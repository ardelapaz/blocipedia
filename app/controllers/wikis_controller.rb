class WikisController < ApplicationController
before_action :authenticate_user!
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving your Wiki. Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving your Wiki. Please try again."
      render :new
    end
  end

  def destroy 
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to :root
    else
      flash.now[:alert] = "There was an error deleting the wiki. Please try again."
      render :index
    end
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

end
