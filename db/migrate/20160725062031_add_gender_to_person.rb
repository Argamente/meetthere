class AddGenderToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :gender, :integer
  end
end
