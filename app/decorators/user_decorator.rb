class UserDecorator < ApplicationDecorator
  delegate_all

  def name
    "#{first_name} #{last_name}"
  end

  def has_confirmed_member?
    member.confirmed? if member.present?
  end

  def short_name
    "#{first_name} #{last_name}"
  end

  def profile_avatar
    default_avatar
  end

  alias element_avatar profile_avatar
end
