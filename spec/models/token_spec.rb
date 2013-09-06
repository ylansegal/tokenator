require 'spec_helper'

describe Token do
  let(:token) { Token.new :secret => 'some_secret' }

  it 'generates a code' do
    token.code.should_not be_nil
  end
end
