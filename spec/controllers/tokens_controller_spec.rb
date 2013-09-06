require 'spec_helper'

describe TokensController do
  render_views

  let(:user) { FactoryGirl.create(:user) }

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

    it 'redirects to show if present' do
      post :create, :token => FactoryGirl.attributes_for(:token)
      response.should redirect_to(token_path(assigns(:token)))
    end
  end

  context 'GET show' do
    let(:token) { FactoryGirl.create(:token, :user => user) }

    it 'shows a token' do
      get :show, :id => token.to_param
      assigns(:token).should == token
    end
  end
end