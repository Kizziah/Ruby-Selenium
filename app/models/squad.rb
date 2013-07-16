class Squad < ActiveRecord::Base
  attr_accessible :army_id, :name, :points, :size, :extras, :mark, :troops_attributes, :veteran, :meltabomb, :mutation
  belongs_to :army
  has_many :troops
  accepts_nested_attributes_for :troops, allow_destroy: true
  validates_presence_of :name
  after_create :delete_invalid_squad
  
  TYPES = {}

  def count_size
    troops.size
  end

  def delete_invalid_squad
    self.delete unless valid_squad?(self.name)
  end

  private

  def valid_squad?(squad)
    ["Cultist", "Thousand Son", "Havoc", "Marine", "Berzerker", "LandRaider", "Sorcerer", "Kharn", "Terminator", "Deamon Prince",
      "Choas Biker", "Raptor", "Warp Talon", "Tactical", "Scout", "Biker", "WarBoss", "Zogwort", "Weirdboy",
      "Land Speeder", "Stern Guard", "Devestater", "Dante", "Mephiston", "Libarian", "Ork", "Gretchin", "Big Gunz",
      "BattleWagon", "Looted Wagon", "StormBoyz", "Ork Bike", "War Buggy", "TankBustas", "Lootas", "Kommandos", "WarBoss",
      "Zogwort", "Weirdboy", "Great Wolf", "Wolf Lord", "SkyClaw", "Wolfpack", "Lone Wolf", "Wolf Guard", "Blood Claw", "Long Fang", "Grey Hunter", 
      "Wolf Priest"  ].include?(squad)
  end

end
