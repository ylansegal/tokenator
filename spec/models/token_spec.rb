require "spec_helper"

describe Token do
  subject(:token) { FactoryGirl.build(:token) }

  it "generates a code" do
    token.code.should_not be_nil
  end

  it "validates a secret is valid" do
    token.secret = "shh....."
    token.should_not be_valid
  end

  it "cleans whitespaces in secret before validating" do
    secret = "qt4v gmlu 5f5i cvep"
    token = Token.new secret: secret
    token.valid?
    token.secret.should == "qt4vgmlu5f5icvep"
  end
end
