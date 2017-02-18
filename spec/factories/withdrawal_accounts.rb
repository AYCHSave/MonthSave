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

FactoryGirl.define do
  factory :withdrawal_account do
    service "MyString"
    project nil
  end
end
