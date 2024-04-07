module OrdersHelper
  def progress_width(order)
    return '0%' if order.nil?

    case order.status.to_sym
    when :unpaid
      '0%'
    when :paid
      '33%'
    when :shipping
      '66%'
    when :completed
      '100%'
    else
      '0%'
    end
  end
end
