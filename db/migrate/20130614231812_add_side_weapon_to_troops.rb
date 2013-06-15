class AddSideWeaponToTroops < ActiveRecord::Migration
  def change
    add_column :troops, :side_weapon, :string
  end
end
