class TopicsController < ApplicationController
  def index
    @topics = Topic.all 
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    @new_bookmarks = Bookmark.new
  end

  def new
  end

  def edit
  end
end
