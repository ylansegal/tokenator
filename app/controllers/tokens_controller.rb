class TokensController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def new
    @token = current_user.tokens.new
  end

  def create
    @token = current_user.tokens.create(token_params)
    respond_with @token
  end

  def show
    @token = current_user.tokens.find(params[:id])
  end

  private

  def token_params
    params.require(:token).permit(:name, :secret)
  end
end