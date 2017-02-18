module ApplicationHelper
  def coin_bank_savings_total(coin_bank)
    coin_bank.savings.map(&:price).sum
  end
end
