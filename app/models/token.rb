class Token < ActiveRecord::Base
  belongs_to :user

  validates :name, :secret, :presence => true

  def code
    ROTP::TOTP.new(secret)
  end
end
