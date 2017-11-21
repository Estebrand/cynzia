class AddImagetypeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :image_type, :string
  end
end
