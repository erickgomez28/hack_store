class AddStatuToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :statu, :integer
  end
end
