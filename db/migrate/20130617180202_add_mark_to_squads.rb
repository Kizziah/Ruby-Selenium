class AddMarkToSquads < ActiveRecord::Migration
  def change
    add_column :squads, :mark, :string
  end
end
