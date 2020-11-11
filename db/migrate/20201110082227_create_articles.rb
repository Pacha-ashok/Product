class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :author
      t.text :title
      t.text :description
      t.text :url
      t.text :urlToImage
      t.text :content

      t.timestamps
    end
  end
end
