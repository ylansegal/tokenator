class Token < ActiveRecord::Base
  belongs_to :user

  def code
    ROTP::TOTP.new(secret)
  end
end
