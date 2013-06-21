class Squad < ActiveRecord::Base
  attr_accessible :army_id, :name, :points, :size, :extras, :mark, :troops_attributes, :veteran, :meltabomb, :mutation
  belongs_to :army
  has_many :troops
  accepts_nested_attributes_for :troops, allow_destroy: true
  validates_presence_of :name
  after_create :delete_if_not_valid

  TYPES = {
    havoc: "Havoc",
    cultist: "Cultists",
    korne_bezerker: "Korne Bezerker",
    marine: "Marine"
  }

  def veteran_status
    "Veteran of Long War" if veteran?
  end

  def valid_squad?(squad)
    ["Cultist", "Thousand Son", "Havoc", "Marine", "Berzerker", "LandRaider", "Sorcerer", "Kharn", "Terminator", "Deamon Prince",
      "Choas Biker", "Raptor", "Warp Talon"].include?(squad)
  end

  def delete_if_not_valid
    self.delete unless valid_squad?(self.name)
  end

  def define_base_squad
    if self.name == "havoc"
      self.update_attribute(:size, 5)
      self.update_attribute(:points, 75)

    end

    if self.name == "cultist"
      self.update_attribute(:size, 10)
      self.update_attribute(:points, 50)
      self.size.times { self.troops.build }
    end

    if self.name == "marine"
      self.update_attribute(:size, 5)
      self.update_attribute(:points, 75)
    end

  end

end
