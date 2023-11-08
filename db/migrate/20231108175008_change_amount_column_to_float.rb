class ChangeAmountColumnToFloat < ActiveRecord::Migration[7.1]
  def change
    change_column :payments, :amount, :float
  end
end
