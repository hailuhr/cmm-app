class CreateTaskTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :task_times do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :notes

      t.belongs_to :user
      t.belongs_to :task
    end
  end
end
