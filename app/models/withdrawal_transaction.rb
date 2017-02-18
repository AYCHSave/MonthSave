# == Schema Information
#
# Table name: withdrawal_transactions
#
#  id          :integer          not null, primary key
#  price_cents :integer
#  account_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_withdrawal_transactions_on_account_id  (account_id)
#

class WithdrawalTransaction < ApplicationRecord
  monetize :price_cents, as: 'price'

  belongs_to :account
end
