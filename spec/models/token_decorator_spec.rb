require "spec_helper"

describe TokenDecorator do
  subject { described_class.new(FactoryBot.build(:token)) }

  it "formats tokens for easy reading" do
    expect(subject.code).to match(/\d{3} \d{3}/)
  end
end
