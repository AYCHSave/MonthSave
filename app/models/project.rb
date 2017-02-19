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
#  uuid        :string
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

  validates_presence_of :title, :description, :image_url, :uuid

  before_validation :generate_uuid

  def self.search(search)
    return all if search.nil?
    where('name ILIKE ?', "%#{search}%")
    where('description ILIKE ?', "%#{search}%")
  end

  def self.public
    where(public: true)
  end

  def total_contributed
    self.transactions.sum(&:price)
  end

  def to_param
    self.uuid
  end

  protected

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
