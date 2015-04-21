class WelcomeController < ApplicationController
  def index
    if current_user
    redirect_to topics_path
    else
      :index
      end
  end
end
