class TaskTime < ApplicationRecord

  belongs_to :user
  belongs_to :task

  validates :start_time, :notes, presence: true

  def calculate_duration
    # end_time -  start_time
    seconds = (end_time - start_time).to_i
    sec = seconds % 60
    minutes = seconds / 60
    min = minutes % 60
    hours = minutes / 60


     "hours: #{hours} minutes: #{min}"
  end

end
