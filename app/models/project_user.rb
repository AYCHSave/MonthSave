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
#

class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates_inclusion_of :percentage, :in => 1..100

  delegate :title, to: :project
end
