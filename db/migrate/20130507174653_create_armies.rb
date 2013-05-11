class CreateArmies < ActiveRecord::Migration
  def change
    create_table :armies do |t|
      t.string :name
      t.string :faction

      t.timestamps
    end
  end
end
