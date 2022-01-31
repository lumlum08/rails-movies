class ListsController < ApplicationController

  before_action :set_list, only: [:show, :destroy]

  def index
    if params[:search].present?
      @lists = search_method(params[:search])
    else
      @lists = List.all
    end
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
    if params[:search].present?
      add_film(params[:search], @list)
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
    render 'new'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def add_film(params, list)
    @movie = Movie.find_by(title: params[:title])
    @bookmark = Bookmark.new(comment: "aucun commentaire", movie_id: @movie.id, list_id: list.id)
    if @bookmark.save
      redirect_to list_path(list)
    end
  end

  def search_method(params)
    if params[:title] == ""
      @lists = List.all
    else
      @movie = Movie.find_by(title: params[:title])
      @lists = []
      @bookmarks = @movie.bookmarks
      @bookmarks.each do |bookmark|
        @lists << bookmark.list
      end
      @lists = @lists.uniq
    end
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
