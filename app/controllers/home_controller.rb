class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tokens = current_user.tokens
  end
end
