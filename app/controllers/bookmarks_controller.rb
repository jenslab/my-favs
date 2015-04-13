class BookmarksController < ApplicationController
  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
  @topic = Topic.find(params[:id])
  @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:url))
  @bookmark.topic = @topic

    if @bookmark.save
      redirect_to topics_path, notice: "Bookmark was saved!"
    else
      flash[:error] = "Ooops, couldn't save your new bookmark. Please try again later."
      render :new
    end
  end

  def edit
  end
end
