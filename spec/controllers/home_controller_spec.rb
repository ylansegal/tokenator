require 'spec_helper'

describe HomeController do
  render_views

  describe "GET 'index'" do
    let(:user) { FactoryGirl.create(:user) }

    it "should be successful" do
      get :index
      response.should be_success
    end

    it 'redirects to tokens if signed-in' do
      sign_in user
      get :index
      response.should redirect_to(tokens_path)
    end
  end
end
