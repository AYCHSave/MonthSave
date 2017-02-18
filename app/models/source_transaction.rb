# == Schema Information
#
# Table name: source_transactions
#
#  id          :integer          not null, primary key
#  external_id :string
#  description :string
#  price_cents :integer
#  account_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_source_transactions_on_account_id  (account_id)
#

class SourceTransaction < ApplicationRecord
  monetize :price_cents, as: 'price'

  belongs_to :account, class_name: 'SourceAccount'
end
