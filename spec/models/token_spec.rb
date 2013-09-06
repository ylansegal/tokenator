require 'spec_helper'

describe Token do
  let(:token) { FactoryGirl.build(:token) }

  it 'generates a code' do
    token.code.should_not be_nil
  end
end
