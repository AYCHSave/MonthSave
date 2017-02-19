class CreateSaving
  def initialize(transaction, coin_bank)
    @transaction = transaction
    @coin_bank   = coin_bank
  end

  def process
    price = calculate_saving_price
    @coin_bank.savings.create(source_transaction: @transaction, price_cents: price)
  end

  private

  def calculate_saving_price
    @transaction.price_cents.ceil(-2) - @transaction.price_cents
  end
end
