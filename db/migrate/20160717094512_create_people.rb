class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.belongs_to :user_account, index:true
      t.string :nickname
      t.integer :birthday_year
      t.integer :birthday_month
      t.integer :birthday_day
      t.string :location
      t.string :mood
      t.string :head_url
      t.integer :account_id, index:true

      t.timestamps
    end
  end
end
