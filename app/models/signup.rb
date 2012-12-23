class Signup
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Virtus

  attribute :username
  attribute :password
  attribute :password_confirmation
  attribute :minecraft_login
  attribute :minecraft_password

  attr_reader :user

  validates :username, :password, :minecraft_login, :minecraft_password, presence: true
  validates :password, confirmation: true
  validate :is_authentic_minecraft_user
  validate :is_unique_username

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def is_unique_username
    if User.where(username: username).exists?
      errors.add(:username, 'is already signed up')
    end
  end

  def is_authentic_minecraft_user
    verifier = MinecraftAccountVerifier.new(minecraft_login, username, minecraft_password)
    unless verifier.authentic?
      errors.add(:minecraft_login, verifier.error)
    end
  end

  private
  def persist!
    @user = User.create!(username: username, password: password)
  end
end
