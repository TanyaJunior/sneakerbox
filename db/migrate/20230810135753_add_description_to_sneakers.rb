class AddDescriptionToSneakers < ActiveRecord::Migration[7.0]
  def change
    add_column :sneakers, :description, :text
  end
end
