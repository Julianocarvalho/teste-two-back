class AddElapsedTimeToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :elapsed_time, :float
  end
end
