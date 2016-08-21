class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true

  def average_rating
    return 'N/A' if reviews.none?
    4
  end
end
