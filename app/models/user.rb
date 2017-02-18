class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
end
