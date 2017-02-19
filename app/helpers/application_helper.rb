module ApplicationHelper
  def coin_bank_savings_total(coin_bank)
    "R$ #{coin_bank.savings.map(&:price).sum}"
  end

  def nav_link(link_path, &block)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_path, &block
    end
  end
end
