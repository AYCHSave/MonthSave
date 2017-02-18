class User < ApplicationRecord
  has_many :own_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :contribuiting_projects, class_name: 'ProjectUser', foreign_key: 'user_id'
end
