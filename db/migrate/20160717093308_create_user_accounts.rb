class CreateUserAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_accounts do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :phone
      t.string :wechat_param
      t.string :qq_param
      t.string :password_digest
      t.integer :account_id, index:true
      t.timestamps
    end
  end
end
