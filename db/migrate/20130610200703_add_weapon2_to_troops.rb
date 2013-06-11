class AddWeapon2ToTroops < ActiveRecord::Migration
  def change
    add_column :troops, :weapon2, :string
  end
end
