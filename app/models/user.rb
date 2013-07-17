class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

end
