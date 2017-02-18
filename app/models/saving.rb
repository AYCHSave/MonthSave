# == Schema Information
#
# Table name: savings
#
#  id                    :integer          not null, primary key
#  source_transaction_id :integer
#  coin_bank_id          :integer
#  price_cents           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_savings_on_coin_bank_id           (coin_bank_id)
#  index_savings_on_source_transaction_id  (source_transaction_id)
#

class Saving < ApplicationRecord
  monetize :price_cents, as: 'price'

  belongs_to :source_transaction
  belongs_to :coin_bank
end
