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

    projects = @user.contributing_projects.to_a

    projects.each do |user_project|
      amount = total * user_project.percentage / 100
      minimum = user_project.min


      project_account = user_project.project.account

      if minimum > amount
        difference = minimum - amount
        charge_user_difference(@coin_bank, difference, user_project.title)
        amount = minimum
      end

      project_account.transactions.create(price: amount, user: @user)

    end
  end

  def create_new_coin_bank
    user = @coin_bank.owner
    user.coin_banks.create
  end

  def charge_user_difference(coin_bank, amount, project_title)
    params = { transaction_date: Time.now,
              description: "Troquinho contribuição mínima #{project_title}",
              price: 0, external_id: rand(36**8).to_s(36) }

    transaction = @user.accounts.first.transactions.create!(params)
    coin_bank.savings.create(source_transaction: transaction, price: amount)
  end
end
