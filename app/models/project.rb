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
#  public      :boolean          default("false")
#
# Indexes
#
#  index_projects_on_owner_id  (owner_id)
#

class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_one :account, class_name: 'WithdrawalAccount'
  has_many :transactions, through: :account
  has_many :project_users
  has_many :contributing_users, class_name: 'User', through: :project_users, source: :user

  validates_presence_of :title, :description, :image_url

  def total_contributed
    self.transactions.sum(&:price)
  end
end
