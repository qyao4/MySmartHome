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

  def light_on(order,step)
    return false if order.nil?

    lights = 0
    lights = lights + 1 if order.status.to_sym == :unpaid
    lights = lights + 1 if order.status.to_sym == :paid
    lights = lights + 1 if order.status.to_sym == :shipping
    lights = lights + 1 if order.status.to_sym == :completed

    if step <= lights
      true
    else
      false

    end

  end

end
