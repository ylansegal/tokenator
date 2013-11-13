require 'spec_helper'

describe 'tokens/index.html.haml' do
  it 'displays tokens starting with zero' do
    token = FactoryGirl.create(:token)
    token.stub(:code).and_return(12345)
    assign(:tokens, [token])

    render

    rendered.should  include('012345')
  end
end
