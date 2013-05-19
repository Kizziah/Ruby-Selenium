class Army < ActiveRecord::Base
  attr_accessible :faction, :name, :squads_attributes, :extra
  has_many :squads
  accepts_nested_attributes_for :squads, allow_destroy: true

  FACTIONS = [
    "Choas Force",
    "Blood Marine",
    "Dark Angel"
  ]

  def points
    total = 0
    squads.each do |squad|
      total += squad.points unless squad.points.nil?
    end
    total
  end

end
