class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :shoe_type
      t.string :shoe_design

      t.timestamps
    end
  end
end
