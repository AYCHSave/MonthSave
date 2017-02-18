class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :project_users
  has_many :contributing_users, class_name: 'User', through: :project_users, source: :user
end
