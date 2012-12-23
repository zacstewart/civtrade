class UserDecorator < Draper::Base
  decorates :user

  def avatar(size=180)
    h.minecraft_avatar(user.username, size)
  end
end
