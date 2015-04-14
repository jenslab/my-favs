class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:bookmarks)
  end

  def show
    @topic = Topic.find(params[:id])
    @title = @topic.title
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))

    if @topic.save
      redirect_to topics_path, notice: "Topic was saved!"
    else
      flash[:error] = "Ooops, couldn't save your new topic. Please try again later."
      render :new
    end
  end

  def edit
  end

  def destroy
    @topic = Topic.find(params[:id])
    title = @topic.title 

    if @topic.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "ooops, couldn't delete the topic. Please try again later."
      render :index
    end
  end
end
