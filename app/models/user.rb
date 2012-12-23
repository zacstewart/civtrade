class User < ActiveRecord::Base
  has_secure_password

  def anonymous?
    false
  end

  def to_param
    username.downcase
  end

  def self.find_by_param(param)
    where(username: param).first_or_initialize
  end
end
