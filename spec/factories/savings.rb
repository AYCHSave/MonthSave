# == Schema Information
#
# Table name: savings
#
#  id                    :integer          not null, primary key
#  source_transaction_id :integer
#  coin_bank_id          :integer
#  price_cents           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

FactoryGirl.define do
  factory :saving do
    source_transaction nil
    coin_bank nil
    price_cents "MyString"
  end
end
