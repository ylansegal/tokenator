require 'spec_helper'

describe 'tokens/index.html.haml', type: :view do
  it 'displays tokens starting with zero' do
    token = FactoryGirl.create(:token)
    expect(token).to receive(:code).and_return('070349')
    assign(:tokens, [token])

    render

    expect(rendered).to include('070349')
  end
end
