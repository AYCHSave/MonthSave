# == Schema Information
#
# Table name: project_users
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  percentage :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  min_cents  :integer
#
# Indexes
#
#  index_project_users_on_project_id  (project_id)
#  index_project_users_on_user_id     (user_id)
#

class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  monetize :min_cents, as: 'min'

  validates_inclusion_of :percentage, :in => 1..100
  validates :min_cents, :numericality => { :greater_than_or_equal_to => 0 }, allow_nil: true

  delegate :title, :image_url, to: :project
end
