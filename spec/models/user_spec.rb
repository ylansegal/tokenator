require "spec_helper"

describe User do
  before(:each) do
    @attr = {
      name: "Example User",
      email: "user@example.com",
      password: "changeme",
      password_confirmation: "changeme"
    }
  end

  it "creates a new instance given a valid attribute" do
    -> { User.create!(@attr) }.should change { User.count }.by(1)
  end

  it "requires an email address" do
    no_email_user = User.new(@attr.merge(email: ""))
    no_email_user.should_not be_valid
  end

  it "accepts valid email addresses" do
    addresses = %w(user@foo.com THE_USER@foo.bar.org first.last@foo.jp)
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(email: address))
      valid_email_user.should be_valid
    end
  end

  it "rejects duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "rejects email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(email: upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do
    before(:each) do
      @user = User.new(@attr)
    end

    it "has a password attribute" do
      @user.should respond_to(:password)
    end

    it "has a a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do
    it "requires a password" do
      User.new(@attr.merge(password: "", password_confirmation: ""))
        .should_not be_valid
    end

    it "requires a matching password confirmation" do
      User.new(@attr.merge(password_confirmation: "invalid"))
        .should_not be_valid
    end

    it "rejects short passwords" do
      short = "a" * 5
      hash = @attr.merge(password: short, password_confirmation: short)
      User.new(hash).should_not be_valid
    end
  end

  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "has an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "sets the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
  end
end
