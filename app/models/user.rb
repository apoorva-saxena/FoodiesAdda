class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :restaurants
         has_many :reviews
         has_many :reviewed_restaurants, through: :reviews, source: :restaurants


         def has_reviewed?(restaurants)
           reviewed_restaurants.include? restaurant
         end
end
