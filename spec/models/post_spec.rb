require 'rails_helper'
RSpec.describe Post, type: :model do
  it 'is valid with valid attributes'do
    post=FactoryBot.build(:post)
    expect(post).to be_valid
  end
  it'is not valid without a title'do
    post=FactoryBot.build(:post,title: nil)
    expect(post).not_to be_valid
  end
  it'is not valid without a body'do
    post=FactoryBot.build(:post,body: nil)
    expect(post).not_to be_valid
  end






  let(:post) { FactoryBot.create(:post) }

  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end
  describe 'associations' do
    before do
      # Creating a post with associated comments and ratings
      post.comments << FactoryBot.create(:comment)
      post.ratings << FactoryBot.create(:rating)
    end

    it { should have_many(:comments) }
    it { should have_many(:ratings) }
  end


  # describe 'associations' do
  #   before do
  #     # Creating a post with associated comments and ratings
  #     post.comments << FactoryBot.create(:comment)
  #     post.ratings << FactoryBot.create(:rating)
  #   end
  #
  #
  #
  #   it { should have_many(:comments).dependent(:destroy) }
  #   it { should have_many(:ratings).dependent(:destroy) }
  # end

  end