class BookmarksController < ApplicationController


  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
  @topic = Topic.find(params[:topic_id])
  @bookmark = current_user.bookmarks.build(bookmark_params)
  @bookmark.topic = @topic

    if @bookmark.save
      redirect_to @topic, notice: "Bookmark was saved!"
    else
      flash[:error] = "Ooops, couldn't save your new bookmark. Please try again later."
      render :show
    end
  end

  def edit
  @topic = Topic.find(params[:topic_id])
  @bookmark = Bookmark.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update_attributes(bookmark_params)
      redirect_to @topic, notice: "Topic was updated!"
    else
      flash[:error] = "Oooops, couldn't update your topic. Please try again later."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    url = @bookmark.url

    if @bookmark.destroy
      flash[:notice] = "Your bookmark was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "Ooops, couldn't delete the bookmark. Please try again later."
      render :show
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
