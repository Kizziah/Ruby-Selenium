class AddMutationToSquads < ActiveRecord::Migration
  def change
    add_column :squads, :mutation, :boolean
  end
end
