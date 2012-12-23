class Bounty < ActiveRecord::Base
  has_many :pledges

  scope :newest, order('created_at DESC')

  def self.for_username(username)
    where('lower(username) = lower(?)', username).first
  end

  def user
    @user ||= UserDecorator.find_by_param(username)
  end
end
