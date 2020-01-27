class Task < ApplicationRecord

  belongs_to :project
  has_many :task_time
  has_many :users, through: :task_time

  validates :name, :description, presence: true

end
