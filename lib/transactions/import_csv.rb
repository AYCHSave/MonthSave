require 'csv'

class Transactions::ImportCsv
  def initialize(account, csv_path)
    @account  = account
    @csv_path = csv_path
  end

  def process
    count = 0

    ActiveRecord::Base.transaction do
      CSV.foreach(@csv_path, headers: true) do |row|
        count += 1
        process_each(row)
      end
    end

    count
  end

  private

  def process_each(row)
    source_transaction = SourceTransaction.create(account: @account,
                                                  external_id: row['EXTERNAL_ID'],
                                                  description: row['DESCRIPTION'],
                                                  price_cents: row['PRICE_CENTS'],
                                                  transaction_date: row['CREATED_AT'])
    if source_transaction.valid?
      CreateSaving.new(source_transaction, @account.owner.coin_banks.active).process
    else
      logger_error(source_transaction.errors)
    end
  end

  def logger_error(errors)
    puts '~~> [ERROR]'
    puts errors.full_messages.join
  end
end
