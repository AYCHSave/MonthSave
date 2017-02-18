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

FactoryGirl.define do
  factory :source_account do
    service "MyString"
    user_id nil
  end
end
