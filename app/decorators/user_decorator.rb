class UserDecorator < Draper::Decorator
  delegate_all
  decorates :user

  def avatar(size=180)
    h.minecraft_avatar(user.username, size)
  end

  def state_tag
    h.content_tag('span')
  end

  def username_with_state
    [
      user.username,
      ' ',
      h.content_tag('span', user.state.capitalize, class: "label #{state_label_class}")
    ].reduce(:+)
  end

  def state_label_class
    case user.state
    when 'unverified' then 'label-important'
    when 'verified' then 'label-success'
    end
  end
end
