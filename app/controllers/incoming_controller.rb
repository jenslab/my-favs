class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
 
    sender_email = params[:sender]
    topic_name = params[:subject]
    
     # Find the user by using params[:sender]
     user = User.find_by_email(sender_email)

     # Find the topic by using params[:subject]
     topic = Topic.find_by_title(topic_name)

     # Assign the url to a variable after retreiving it from params["body-plain"]
     url = params["body-plain"]

     # Check if user is nil, if so, create and save a new user
     if user.nil?
      user = User.new(name: Guest, email: sender_email, password: 'helloworld')
      user.save!
    end
    
     # Check if the topic is nil, if so, create and save a new topic
     if topic.nil?
      topic = Topic.new(title: params[:subject])
      topic.save!
    end

     # Now that we're sure we have a valid user and topic, build and save a new bookmark
     bookmark = topic.bookmarks.create(url: url)

    # Assuming all went well.
    head 200
  end
end