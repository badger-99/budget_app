class CreateCategoryPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :category_payments do |t|
      t.references :category, null: false, foreign_key: true, index:true
      t.references :payment, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
