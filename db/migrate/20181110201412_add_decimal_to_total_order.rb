class AddDecimalToTotalOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :total, :float
    add_column :orders, :total, :decimal
  end
end
