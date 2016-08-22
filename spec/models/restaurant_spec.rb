require 'spec_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three charatcters' do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid until it has a unique name' do
    Restaurant.create(name: 'Moe Tavern')
    restaurant = Restaurant.new(name: 'Moe Tavern')
    expect(restaurant).to have(1).error_on(:name)
  end

  describe '#average rating' do
    context 'no reviews' do
      it 'returns "N/A" when there are no reviews' do
        restaurant = Restaurant.create(name: "The Ivy")
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end

    context '1 review' do
      it 'returns that rating' do
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end
    end

    context 'multiple review' do
      it 'returns the average' do
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 1)
        restaurant.reviews.create(rating: 5)
        expect(restaurant.average_rating).to eq 3
      end
    end
  end
end
