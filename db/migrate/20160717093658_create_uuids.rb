class CreateUuids < ActiveRecord::Migration[5.0]
  def change
    create_table :uuids do |t|
      t.integer :account_id
      t.integer :person_id
      t.integer :story_id
      t.integer :memory_id

      t.timestamps
    end
  end
end
