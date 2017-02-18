class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :own_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :contributing_projects, class_name: 'ProjectUser', foreign_key: 'user_id'
end
