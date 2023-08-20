class AddModelToSneakers < ActiveRecord::Migration[7.0]
  def change
    add_column :sneakers, :model, :string
  end
end
