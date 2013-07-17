class AddProfileIdToArmies < ActiveRecord::Migration
  def change
    add_column :armies, :profile_id, :integer
  end
end
