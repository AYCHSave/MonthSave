# == Schema Information
#
# Table name: withdrawal_transactions
#
#  id          :integer          not null, primary key
#  price_cents :integer
#  account_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_withdrawal_transactions_on_account_id  (account_id)
#  index_withdrawal_transactions_on_user_id     (user_id)
#

class WithdrawalTransaction < ApplicationRecord
  monetize :price_cents, as: 'price'

  belongs_to :account, class_name: 'WithdrawalAccount'
  belongs_to :user
end
