# == Schema Information
#
# Table name: withdrawal_transactions
#
#  id          :integer          not null, primary key
#  price_cents :integer
#  account_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :withdrawal_transaction do
    price_cents 1
    account nil
  end
end
