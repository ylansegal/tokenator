class Token < ActiveRecord::Base
  belongs_to :user

  validates :name, :secret, :presence => true
  validate :secret_is_valid

  def code
    ROTP::TOTP.new(self.secret).now
  end

  private

  def secret_is_valid
    begin
      code
    rescue
      errors.add :secret, 'is not a valid base32 secret'
    end
  end
end
