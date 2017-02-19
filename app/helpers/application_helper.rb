module ApplicationHelper
  def coin_bank_savings_total(coin_bank)
    "R$ #{coin_bank.savings.map(&:price).sum}"
  end

  def nav_link(link_path, &block)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to link_path, &block
    end
  end

  def account_logo(service)
    case service
    when 'Banco do Brasil'
      'http://seeklogo.com/images/B/Banco_do_Brasil-logo-68C92EDFE8-seeklogo.com.gif'
    when 'NuBank'
      'http://productbr.com/wp-content/uploads/2016/04/nubank-logo.png'
    when 'PayPal'
      'https://raw.githubusercontent.com/samsel/paypal-logo-canvas/master/example/example.png'
    end
  end
end
