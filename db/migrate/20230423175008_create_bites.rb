class CreateBites < ActiveRecord::Migration[7.0]
  def change
    create_table :bites do |t|
      t.string :image
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
