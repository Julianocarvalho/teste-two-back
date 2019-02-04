class RemoveStartedDateFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :started_date, :datetime
  end
end
