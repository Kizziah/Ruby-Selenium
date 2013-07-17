class Profile < ActiveRecord::Base
  attr_accessible :name, :user_id, :armies_attributes
  belongs_to :user
	has_many :armies
 	accepts_nested_attributes_for :armies, allow_destroy: true

end
