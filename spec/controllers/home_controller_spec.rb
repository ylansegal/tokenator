require 'spec_helper'

describe HomeController do
  render_views

  describe "GET 'index'" do
    context 'with logged-in user' do
      let(:token) { FactoryGirl.create(:token) }
      let(:user) { token.user }

      before :each do
        sign_in(user)
      end

      it "should be successful" do
        get 'index'
        response.should be_success
      end

      it 'assigns tokens' do
        get :index
        assigns(:tokens).should include(token)
      end
    end

    context 'with no user' do
      it 'should redirect to login-in path' do
        get 'index'
        response.should redirect_to(new_user_session_path)
      end
    end
  end
end
