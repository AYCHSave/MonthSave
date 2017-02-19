# == Schema Information
#
# Table name: withdrawal_accounts
#
#  id         :integer          not null, primary key
#  service    :string
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_withdrawal_accounts_on_project_id  (project_id)
#

class WithdrawalAccount < ApplicationRecord
  belongs_to :project

  has_many :withdrawal_transactions, class_name: 'WithdrawalTransaction', foreign_key: 'account_id'
end
