# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  owner_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_one :account, class_name: 'WithdrawalAccount'
end
