# == Schema Information
#
# Table name: source_transactions
#
#  id          :integer          not null, primary key
#  external_id :string
#  description :string
#  price_cents :integer
#  account_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :source_transaction do
    external_id "MyString"
    description "MyString"
    price_cents 1
    source_account nil
  end
end
