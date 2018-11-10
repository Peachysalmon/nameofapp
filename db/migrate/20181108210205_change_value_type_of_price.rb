class ChangeValueTypeOfPrice < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :price, :integer
    add_column :products, :price, :decimal
  end
end
