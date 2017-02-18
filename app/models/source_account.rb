# == Schema Information
#
# Table name: source_accounts
#
#  id         :integer          not null, primary key
#  service    :string
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SourceAccount < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :transactions, class_name: 'SourceTransaction', foreign_key: 'account_id'
end
