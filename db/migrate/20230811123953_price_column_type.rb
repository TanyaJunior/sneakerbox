class PriceColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :sneakers, :price, 'integer USING CAST(price AS integer)'
  end
end
