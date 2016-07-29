class AddDataStrAndTimeStrToStory < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :area, :string,index:true
    add_column :stories, :date_str, :string
    add_column :stories, :time_str, :string
  end
end
