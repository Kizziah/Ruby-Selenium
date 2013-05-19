class CreateTroops < ActiveRecord::Migration
  def change
    create_table :troops do |t|
      t.integer :squad_id
      t.integer :name
      t.integer :points
      t.string :weapon

      t.timestamps
    end
  end
end
