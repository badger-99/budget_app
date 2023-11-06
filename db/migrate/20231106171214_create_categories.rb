class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, unique: true
      t.string :icon
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
