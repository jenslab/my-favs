class BookmarksController < ApplicationController


  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
  @topic = Topic.find(params[:topic_id])
  @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:url))
  @bookmark.topic = @topic

    if @bookmark.save
      redirect_to @topic, notice: "Bookmark was saved!"
    else
      flash[:error] = "Ooops, couldn't save your new bookmark. Please try again later."
      render :show
    end
  end

  def edit
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    url = @bookmark.url

    if @bookmark.destroy
      flash[:notice] = "Your bookmark was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "Ooops, couldn't delete the bookmark. Please try again later."
      render :show
    end
  end
end
