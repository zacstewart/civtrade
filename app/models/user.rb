class User < ActiveRecord::Base
  has_secure_password

  state_machine :state, initial: :new do
    event :mark_verified do
      transition any => :verified
    end

    state :new do
    end

    state :unverified do
    end

    state :verified do
    end
  end

  def anonymous?
    false
  end

  def to_param
    username.downcase
  end

  def self.find_by_param(param)
    named(param)
  end

  def self.named(name)
    where(username: name).first_or_initialize
  end
end
