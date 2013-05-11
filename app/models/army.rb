class Army < ActiveRecord::Base
  attr_accessible :faction, :name, :squads_attributes
  has_many :squads
  accepts_nested_attributes_for :squads, allow_destroy: true


  FACTIONS = [
    "Choas Force",
    "Blood Marine",
    "Dark Angel"
  ]


end
