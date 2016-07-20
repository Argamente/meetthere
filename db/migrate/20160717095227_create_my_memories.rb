class CreateMyMemories < ActiveRecord::Migration[5.0]
  def change
    create_table :my_memories do |t|
      t.integer :story_id,index:true
      t.integer :account_id,index:true

      t.timestamps
    end
  end
end
