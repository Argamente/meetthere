class AddGroupStrToStory < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :group_str, :string
  end
end
