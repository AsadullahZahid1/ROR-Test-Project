require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes " do
    user=FactoryBot.build( :user, email:"test@example.com",password:"password")
    expect(user).to be_valid
  end
  it "is not valid without an email" do
    user=FactoryBot.build(:user, email:nil)
    expect(user).not_to be_valid
  end
  it"is not valid without an password"do
    user=FactoryBot.build(:user, password:nil)
    expect(user).not_to be_valid
  end
  it "sends confirmation email after sign-up " do
    user=FactoryBot.create(:user,confirmed_at:nil)
    expect{user.confirm}.to change{ActionMailer::Base.deliveries.count}.by(0)
  end
end