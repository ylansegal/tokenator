require 'spec_helper'

describe 'tokens/index.html.haml' do
  it 'displays tokens starting with zero' do
    token = FactoryGirl.create(:token)
    expect(token).to receive(:code).and_return(12345)
    assign(:tokens, [token])

    render

    expect(rendered).to include('012345')
  end
end
