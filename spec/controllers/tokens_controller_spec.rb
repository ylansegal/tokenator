require 'spec_helper'

describe TokensController do
  render_views

  let(:user) { FactoryGirl.create(:user) }
  let(:token) { FactoryGirl.create(:token, :user => user) }

  before :each do
    sign_in user
  end

  context 'GET new' do
    it 'show show form for new token' do
      get :new
      assigns(:token).should be_new_record
    end
  end

  context 'POST create' do
    it 'renders errors if present' do
      post :create, {:token => {:name => ''} }
      assigns(:token).should be_new_record
      response.should render_template('new')
    end

    it 'redirects to show if created' do
      post :create, :token => FactoryGirl.attributes_for(:token)
      response.should redirect_to(token_path(assigns(:token)))
    end
  end

  context 'GET show' do
    it 'shows a token' do
      get :show, :id => token.to_param
      assigns(:token).should == token
    end
  end

  context 'GET edit' do
    it 'shows form for editing' do
      get :edit, :id => token.to_param
      assigns(:token).should == token
    end
  end

  context 'PUT update' do
    it 'renders errors if present' do
      put :update, :token => token.attributes.merge(:secret => ''), :id => token.to_param
      response.should render_template('edit')
    end

    it 'redirects to show if updated' do
      name = "New name"
      put :update, :token => token.attributes.merge(:name => name), :id => token.to_param
      assigns(:token).name.should == name
      response.should redirect_to(token_path(assigns(:token)))

    end
  end
end