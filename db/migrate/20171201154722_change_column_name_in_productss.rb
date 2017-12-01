class ChangeColumnNameInProductss < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :rating, :year
  end
end
