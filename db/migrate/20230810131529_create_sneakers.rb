class CreateSneakers < ActiveRecord::Migration[7.0]
  def change
    create_table :sneakers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.string :name
      t.string :size
      t.string :brand

      t.timestamps
    end
  end
end
