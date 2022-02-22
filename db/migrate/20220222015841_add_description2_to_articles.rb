class AddDescription2ToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :description2, :text
  end
end
