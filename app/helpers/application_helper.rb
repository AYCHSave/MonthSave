module ApplicationHelper
  def coin_bank_savings_total(coin_bank)
    "R$ #{coin_bank.savings.map(&:price).sum}"
  end
end
