class AddIndexToProducts < ActiveRecord::Migration[5.2]
  def change
  	add_index :products, [:name], name: "product_name_xx", using: :btree 
    add_index :products, [:material_code], name: "product_material_code_xx", using: :btree 
    add_index :products, [:product_category_code], name: "product_category_code_xx", using: :btree
    add_index :products, [:status], name: "product_status_xx", using: :btree
  end
end
