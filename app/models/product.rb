class Product < ApplicationRecord
  require 'csv'
  validates :name, presence: true
  validates :product_category_code, presence: true
  validates :material_code, :uniqueness => true
	def self.import(file)
		CSV.foreach(file, :headers => true) do |row|
			if Product.where(material_code: row[1]).exists?
				Product.where(material_code: row[1]).update_all(name: row[0], product_category_code: row[2], status: row[3] )
				return {status: "updated"}
			else
	      Product.create ({
	        :name => row[0],
	        :material_code => row[1],
	       :product_category_code => row[2],
	       :status => row[3]
	     })
	      return {status: "create"}
	    end
    end
  end
end