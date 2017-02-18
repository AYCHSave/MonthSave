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

class WithdrawalTransaction < ApplicationRecord
  monetize :price_cents

  belongs_to :account
end
