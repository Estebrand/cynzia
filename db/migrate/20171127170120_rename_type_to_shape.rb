class RenameTypeToShape < ActiveRecord::Migration[5.1]
  def change

  	rename_column :pictures, :type, :shape
  end
end
