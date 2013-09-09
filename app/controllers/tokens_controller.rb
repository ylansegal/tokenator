class TokensController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @tokens = current_user.tokens
  end

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

  def edit
    show
  end

  def update
    @token = current_user.tokens.find(params[:id])
    @token.update_attributes(token_params)
    respond_with @token
  end

  def destroy
    @token = current_user.tokens.find(params[:id])
    @token.destroy
    flash[:notice] = 'Token deleted successfully'
    respond_with @token
  end

  private

  def token_params
    params.require(:token).permit(:name, :secret)
  end
end