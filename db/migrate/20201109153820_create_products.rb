class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :material_code
      t.string :product_category_code
      t.string :status

      t.timestamps
    end
  end
end
