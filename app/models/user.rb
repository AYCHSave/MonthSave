# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string
#  uid                    :string
#  name                   :string
#  email                  :string
#  image_url              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts, class_name: 'SourceAccount', foreign_key: 'owner_id'
  has_many :own_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :contributing_projects, class_name: 'ProjectUser', foreign_key: 'user_id'
  has_many :coin_banks, foreign_key: 'owner_id'
end
