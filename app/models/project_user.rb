class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates_inclusion_of :percentage, :in => 1..100

  delegate :title, to: :project
end
