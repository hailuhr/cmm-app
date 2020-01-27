class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_one :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :task_time
  has_many :tasks, through: :task_time

  validates :email, presence: true
end
