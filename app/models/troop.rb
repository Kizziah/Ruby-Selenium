class Troop < ActiveRecord::Base
  attr_accessible :name, :points, :squad_id, :weapon, :side_weapon, :addons
  belongs_to :squad

end
