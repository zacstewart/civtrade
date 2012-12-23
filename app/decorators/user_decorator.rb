class UserDecorator < Draper::Base
  decorates :user

  def avatar(size=180)
    "https://minotar.net/avatar/#{user.username}/#{size}"
  end
end
