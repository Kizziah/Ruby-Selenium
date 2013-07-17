class Army < ActiveRecord::Base
  attr_accessible :faction, :name, :squads_attributes, :extra, :profile_id
  belongs_to :profile
  has_many :squads
  accepts_nested_attributes_for :squads, allow_destroy: true
  validates_presence_of :name

  FACTIONS = [
    "Choas Force",
    "Blood Marine",
    "Dark Angel"
  ]

  def points
    points = 0
    squads.each do |squad|
      points += squad.points
    end
    points
  end


end
