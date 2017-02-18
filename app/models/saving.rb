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

class Saving < ApplicationRecord
  monetize :price_cents

  belongs_to :source_transaction
  belongs_to :coin_bank
end
