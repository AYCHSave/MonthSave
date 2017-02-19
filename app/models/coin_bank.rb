# == Schema Information
#
# Table name: coin_banks
#
#  id            :integer          not null, primary key
#  owner_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  terminated_at :datetime
#
# Indexes
#
#  index_coin_banks_on_owner_id  (owner_id)
#

class CoinBank < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :savings

  scope :active, -> { order(created_at: :desc).first }
  scope :inactives, -> { order(created_at: :desc).offset(1) }
end
