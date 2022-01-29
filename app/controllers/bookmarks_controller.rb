class BookmarksController < ApplicationController

  def new
    @bookmarks = Bookmark.new
  end

  def create
    @

  end

  def destroy

  end

  private

  def set_bookmark
    raise
    @Bookmark = Bookmark.find(params[:id])

end
