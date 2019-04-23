class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end
