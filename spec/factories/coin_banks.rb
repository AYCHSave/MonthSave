# == Schema Information
#
# Table name: coin_banks
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :coin_bank do
    owner nil
  end
end
