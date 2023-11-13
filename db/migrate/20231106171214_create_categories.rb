class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
