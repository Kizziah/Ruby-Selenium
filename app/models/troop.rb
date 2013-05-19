class Troop < ActiveRecord::Base
  attr_accessible :name, :points, :squad_id, :weapon
  belongs_to :squad

  WEAPONS = [
    :meltagun,
    :missle_launcher,
    :boltgun
  ]

end
