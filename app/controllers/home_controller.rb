class HomeController < ApplicationController
  def index
    redirect_to tokens_path if current_user
  end
end
