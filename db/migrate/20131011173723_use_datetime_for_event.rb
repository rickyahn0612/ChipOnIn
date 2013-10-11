class UseDatetimeForEvent < ActiveRecord::Migration
  def change
   	add_column :events, :date_time, :datetime
  	remove_column :events, :time, :integer
  	remove_column :events, :date, :string
  end
end