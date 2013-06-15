class Troop < ActiveRecord::Base
  attr_accessible :name, :points, :squad_id, :weapon, :side_weapon
  belongs_to :squad

  WEAPONS = [
    :meltagun,
    :missle_launcher,
    :boltgun
  ]

  SIDEWEAPONS =[
    :pistol
  ]

Points = [
  "hello",
  "goodbye"
]

end
