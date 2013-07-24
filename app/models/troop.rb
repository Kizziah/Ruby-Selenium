class Troop < ActiveRecord::Base
  attr_accessible :name, :points, :squad_id, :weapon, :side_weapon, :addons
  belongs_to :squad
  after_create :name_troop

  def name_troop
  	self.name = 8
  end
end
