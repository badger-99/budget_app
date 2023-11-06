class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.decimal :amount, precision: 9, scale: 2
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
