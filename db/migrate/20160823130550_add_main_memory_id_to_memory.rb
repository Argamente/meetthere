class AddMainMemoryIdToMemory < ActiveRecord::Migration[5.0]
  def change
    add_column :memories, :main_memory_id, :integer
  end
end
