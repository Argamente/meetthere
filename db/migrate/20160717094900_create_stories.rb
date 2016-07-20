class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.belongs_to :people ,index:true
      t.string :content
      t.string :wantsay
      t.integer :date_year
      t.integer :date_month,index:true
      t.integer :date_day,index:true
      t.integer :time_hour,index:true
      t.integer :time_minute
      t.integer :story_timestamp
      t.string :addr_province
      t.string :addr_city,index:true
      t.string :addr_detail
      t.integer :peoples_number
      t.integer :target_gender
      t.integer :message_number
      t.integer :like_number
      t.integer :status
      t.integer :story_id,index:true
      t.integer :account_id,index:true

      t.timestamps
    end
  end
end
