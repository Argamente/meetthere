class ChangePeopleIdInStory < ActiveRecord::Migration[5.0]
  def change
    rename_column :stories, :people_id, :person_id
  end
end
