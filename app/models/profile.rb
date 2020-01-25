class Profile < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :first_name, presence: true


  def full_name
    "#{first_name} #{last_name}".strip
  end
end
