class CreateSneakers < ActiveRecord::Migration[6.0]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
