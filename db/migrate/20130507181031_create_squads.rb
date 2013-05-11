class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.string :name
      t.integer :points
      t.integer :size
      t.integer :army_id

      t.timestamps
    end
  end
end
