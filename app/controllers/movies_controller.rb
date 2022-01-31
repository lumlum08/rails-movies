class MoviesController < ApplicationController
  class ReviewsController < ApplicationController
  def create
    @movie = movie.new(movie_params)
    @list = List.find(params[:list_id])
    @movie.list = @list
    if @movie.save
      redirect_to list_path(@list)
    else
    render 'list/show'
    end
  end

  def destroy
    @movie = movie.find(params[:id])
    @movie.destroy
    redirect_to list_path(@movie.list)
  end

  private
  def movie_params
    params.require(:movie).permit(:title)
  end
end

end
