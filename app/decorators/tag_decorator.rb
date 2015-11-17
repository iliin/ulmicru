class TagDecorator < ApplicationDecorator
  delegate_all

  def just_text
    case tag_type
    when 'string'
      objec.text
    when 'link'
      case target_type
      when 'Member'
        "#{object.target.ticket} | #{object.target.first_name} #{object.target.last_name}"
      when 'Team'
        object.target.title
      when 'ActivityLine'
        object.target.title
      when 'Event'
        object.target.title
      end
    end
  end
end
