class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
    length: {
      maximum: 10
    }

  validates :description, presence: true,
    length: {
      minimum: 4,
      maximum: 10
    }
  validates :priority, presence: true

  # scope :by_status, lambda { |status|
  #   binding.pry
  #  if status
  #    where(active: status)
  #  else
  #     nil
  #  end
  # }
end
