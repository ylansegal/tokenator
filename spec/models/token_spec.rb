require 'spec_helper'

describe Token do
  let(:token) { FactoryGirl.build(:token) }

  it 'generates a code' do
    token.code.should_not be_nil
  end

  it 'validates a secret is valid' do
    token.secret = 'shh.....'
    token.should_not be_valid
  end
end
