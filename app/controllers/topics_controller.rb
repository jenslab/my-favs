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
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      redirect_to topics_path, notice: "Topic was saved!"
    else
      flash[:error] = "Ooops, couldn't save your new topic. Please try again later."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(topic_params)
      redirect_to topics_path, notice: "Topic was updated!"
    else
      flash[:error] = "Oooops, couldn't update your topic. Please try again later."
      render :edit
    end
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

  private
  
  def topic_params
    params.require(:topic).permit(:title)
  end
end
