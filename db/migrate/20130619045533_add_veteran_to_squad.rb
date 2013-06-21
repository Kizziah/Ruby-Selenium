class AddVeteranToSquad < ActiveRecord::Migration
  def change
    add_column :squads, :veteran, :boolean
  end
end
