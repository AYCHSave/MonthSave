class TerminateCoinBank
  def initialize(coin_bank)
    @user = coin_bank.owner
    @coin_bank = coin_bank
  end

  def call
    @coin_bank.transaction do
      terminate_coin_bank
      create_transactions
      create_new_coin_bank
    end
  end

  protected

  def terminate_coin_bank
    @coin_bank.update(terminated_at: Time.now)
  end

  def create_transactions
    total = @coin_bank.savings.sum(&:price)

    @user.contributing_projects.each do |user_project|
      amount = total * user_project.percentage / 100

      project_account = user_project.project.account
      project_account.withdrawal_transactions.create(price: amount)
    end
  end

  def create_new_coin_bank
    user = @coin_bank.owner
    user.coin_banks.create
  end
end
