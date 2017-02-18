class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_one :account, class_name: 'WithdrawalAccount'
end
