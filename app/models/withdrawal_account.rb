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

class WithdrawalAccount < ApplicationRecord
  belongs_to :project
end
