class AddExtrasToSquads < ActiveRecord::Migration
  def change
    add_column :squads, :extras, :string
  end
end
