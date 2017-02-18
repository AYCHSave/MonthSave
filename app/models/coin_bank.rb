# == Schema Information
#
# Table name: coin_banks
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CoinBank < ApplicationRecord
  belongs_to :owner, class_name: 'User'
end
