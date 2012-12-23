class Session
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Virtus

  attribute :username
  attribute :password

  validates :username, :password, presence: true

  attr_reader :user

  def authenticate
    user = User.where(username: username).first

    if user && user.authenticate(password)
      @user = user
      true
    else
      false
    end
  end

  def persisted?
    false
  end
end
