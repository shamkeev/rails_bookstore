class ChangePriceDecimalPrecision < ActiveRecord::Migration
  def change
    change_column :books, :price, :decimal, :precision => 14, :scale => 2
  end
end
