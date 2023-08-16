require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user){FactoryBot.create(:user)}
  let(:post){FactoryBot.create(:post, user: user)}
  it'is valid with valid attributes'do
    comment=FactoryBot.build(:comment, user: user, post: post)
    expect(comment).to be_valid
  end
  it'is not valid without content'do
    comment=FactoryBot.build(:comment,  user: user, post: post,content: nil)
    expect(comment).not_to be_valid
  end


  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end
  it 'belongs to a post' do
    association = described_class.reflect_on_association(:post)
    expect(association.macro).to eq(:belongs_to)
  end
end