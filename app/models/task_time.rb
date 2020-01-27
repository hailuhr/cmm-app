class TaskTime < ApplicationRecord

  belongs_to :user
  belongs_to :task

  validates :start_time, :end_time, :notes, presence: true

end
