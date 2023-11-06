class RenameUserRefColumnInPayments < ActiveRecord::Migration[7.1]
  def change
    rename_column :payments, :user_id, :author_id
  end
end
