require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  it 'is valid with valid attributes' do
    rating = FactoryBot.build(:rating, user: user, post: post)
    expect(rating).to be_valid
  end

  it 'is not valid without a user' do
    rating = FactoryBot.build(:rating, user: nil, post: post)
    expect(rating).not_to be_valid
  end

  it 'is not valid without a post' do
    rating = FactoryBot.build(:rating, user: user, post: nil)
    expect(rating).not_to be_valid
  end

  it 'is not valid without a rating' do
    rating = FactoryBot.build(:rating, user: user, post: post, rating: nil)
    expect(rating).not_to be_valid
  end

  # it 'is not valid with a rating outside the range of 1 to 5' do
  #   user=FactoryBot.create(:user)
  #   post=FactoryBot.create(:post)
  #   rating = FactoryBot.build(:rating,user: user, post: post,  rating: 6)
  #   expect(rating).not_to be_valid
  # end



  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq(:belongs_to)
    end
  end



end