module ApplicationHelper
  def flash_class(type)
    case type
    when 'notice'
      #'bg-blue-500'
      "flash-success"
    when 'alert'
      # 'bg-red-500'
      "flash-error"
    else
      #'bg-gray-500'
      "flash-info"
    end
  end
end
