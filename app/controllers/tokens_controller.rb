class TokensController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @tokens = current_user
      .tokens
      .by_created_at
      .map { |t| TokenDecorator.new(t) }
  end

  def new
    @token = current_user.tokens.new
  end

  def create
    @token = current_user.tokens.create(token_params)
    flash[:notice] = "#{@token.name} created successfully" if @token.errors.blank?
    respond_with @token, location: tokens_path
  end

  def edit
    @token = token
  end

  def update
    @token = token
    @token.update(token_params)
    flash[:notice] = "#{@token.name} updated successfully"
    respond_with @token, location: tokens_path
  end

  def destroy
    @token = token
    @token.destroy
    flash[:notice] = "Token deleted successfully"
    respond_with @token
  end

  private

  def token
    current_user.tokens.find(params[:id])
  end

  def token_params
    params.require(:token).permit(:name, :secret)
  end
end
