class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :started_date
      t.datetime :closed_date
      t.float :elapsed_time,       default: 0
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
