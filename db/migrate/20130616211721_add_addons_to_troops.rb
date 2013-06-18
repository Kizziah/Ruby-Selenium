class AddAddonsToTroops < ActiveRecord::Migration
  def change
    add_column :troops, :addons, :string
  end
end
