require "spec_helper"

describe TokensController, type: :controller do
  render_views

  let(:user) { FactoryBot.create(:user) }
  let(:token) { FactoryBot.create(:token, user: user) }

  before :each do
    sign_in user
  end

  context "GET new" do
    it "shows form for new token" do
      get :new
      assigns(:token).should be_new_record
    end
  end

  context "POST create" do
    it "renders errors if present" do
      post :create, params: {token: {name: ""}}
      assigns(:token).should be_new_record
      flash[:notice].should be_nil
      response.should render_template("new")
    end

    it "redirects and sets flash if created" do
      post :create, params: {token: FactoryBot.attributes_for(:token)}
      flash[:notice].should =~ /success/
      response.should redirect_to(tokens_path)
    end
  end

  context "GET edit" do
    it "shows form for editing" do
      get :edit, params: {id: token.to_param}
      assigns(:token).id.should == token.id
    end
  end

  context "PUT update" do
    it "renders errors if present" do
      put :update, params: {token: token.attributes.merge("secret" => ""), id: token.to_param}
      response.should render_template("edit")
    end

    it "redirects and sets flash if updated" do
      name = "New name"
      put :update, params: {token: token.attributes.merge("name" => name), id: token.to_param}
      assigns(:token).name.should be == name
      flash[:notice].should =~ /success/
      response.should redirect_to(tokens_path)
    end
  end

  context "GET index" do
    it "lists all users tokens" do
      # force evaluation
      token
      user

      get :index
      assigns(:tokens).should include(token)
      response.should render_template("index")
    end
  end

  context "DELETE destroy" do
    it "deletes the token and redirect to index" do
      delete :destroy, params: {id: token.to_param}
      response.should redirect_to(tokens_path)
      flash[:notice].should =~ /success/
    end
  end
end
