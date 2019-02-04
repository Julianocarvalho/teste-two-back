class RemoveClosedDateFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :closed_date, :datetime
  end
end
