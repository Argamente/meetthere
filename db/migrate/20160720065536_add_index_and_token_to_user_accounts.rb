class AddIndexAndTokenToUserAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :user_accounts, :remember_token, :string
    add_index :user_accounts, :remember_token
  end
end
