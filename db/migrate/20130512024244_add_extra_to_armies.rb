class AddExtraToArmies < ActiveRecord::Migration
  def change
    add_column :armies, :extra, :boolean
  end
end
