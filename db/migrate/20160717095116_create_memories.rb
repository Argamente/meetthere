class CreateMemories < ActiveRecord::Migration[5.0]
  def change
    create_table :memories do |t|
      t.belongs_to :story,index:true
      t.string :content
      t.integer :story_id
      t.integer :memory_id,index:true
      t.integer :account_id,index:true

      t.timestamps
    end
  end
end
