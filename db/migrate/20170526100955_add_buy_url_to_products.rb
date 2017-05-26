class AddBuyUrlToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :buy_url, :string
  end
end
