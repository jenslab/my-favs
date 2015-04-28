class LikesController < ApplicationController

def create
  @bookmark = Bookmark.find(params[:bookmark_id])
  like = current_user.likes.build(bookmark: @bookmark)
 
    if like.save
    flash[:notice] = "You liked this bookmark!"
    redirect_to :back 
    else
    flash[:error] = "Ooops, couldn't like the bookmark. Please try again later."
    rdirect_to :back
    end
end

def destroy
  @bookmark = Bookmark.find(params[:bookmark_id])
  like = current_user.likes.find(params[:id])
 
    if like.destroy
    flash[:notice] = "You unliked this bookmark!"
    redirect_to :back 
    else
    flash[:error] = "Ooops, couldn't unlike the bookmark. Please try again later."
    redirect_to :back
    end
end
end
