FactoryGirl.define do
  factory :source_transaction do
    external_id "MyString"
    description "MyString"
    price_cents 1
    source_account nil
  end
end
