# == Schema Information
#
# Table name: source_accounts
#
#  id         :integer          not null, primary key
#  service    :string
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  password   :string
#  account    :string
#  agency     :string
#
# Indexes
#
#  index_source_accounts_on_owner_id  (owner_id)
#

class SourceAccount < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :transactions, -> { order('transaction_date DESC') },
           class_name: 'SourceTransaction', foreign_key: 'account_id'
  has_many :savings, through: :transactions

  validates :service, presence: true
end
