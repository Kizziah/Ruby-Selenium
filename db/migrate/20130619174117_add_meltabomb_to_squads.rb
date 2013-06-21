class AddMeltabombToSquads < ActiveRecord::Migration
  def change
    add_column :squads, :meltabomb, :boolean
  end
end
