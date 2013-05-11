class Squad < ActiveRecord::Base
  attr_accessible :army_id, :name, :points, :size
  belongs_to :army
  #validates_presence_of :name, :points


  TYPES = {
    havoc: "Havoc",
    cultist: "Cultists",
    korne_bezerker: "Korne Bezerker"
  }

  def add

  end


  def define_squad
    if self.name == "havoc"
      self.points = 75
      self.size = 5
    end

    if self.name == "cultist"
      self.points = 50
      self.size = 10
    end

  end

end
