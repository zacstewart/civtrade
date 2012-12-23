class Signup
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Virtus

  attribute :username
  attribute :password
  attribute :password_confirmation

  attr_reader :user

  validates :username, :password, presence: true
  validates :password, confirmation: true
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
    if User.where('lower(username) = lower(?)', username).exists?
      errors.add(:username, 'is already signed up')
    end
  end

  private
  def persist!
    @user = User.create!(username: username, password: password, state: 'unverified')
  end
end
