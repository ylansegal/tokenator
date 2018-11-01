class Token < ActiveRecord::Base
  belongs_to :user

  before_validation :normalize_secret

  validates :name, :secret, presence: true
  validate :secret_is_valid_base32

  scope :by_created_at, -> { order(:created_at) }

  def code
    ROTP::TOTP.new(secret).now
  end

  private

  def secret_is_valid_base32
    code if secret
  rescue ROTP::Base32::Base32Error
    errors.add :secret, "is not a valid base32 secret"
  end

  def normalize_secret
    secret&.delete!(" ")
  end
end
