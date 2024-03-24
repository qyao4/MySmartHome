module ApplicationHelper
  def flash_class(type)
    case type
    when 'notice'
      'bg-blue-500'
    when 'alert'
      'bg-red-500'
    else
      'bg-gray-500'
    end
  end
end
