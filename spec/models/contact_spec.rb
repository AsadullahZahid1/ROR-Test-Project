require 'rails_helper'

RSpec.describe Contact, type: :model do


  it'is valid with valid attributes'do
    subject="Test Subject"
    message="Test Message"
    contact=FactoryBot.build(:contact, subject: subject,message: message)
    expect(contact).to be_valid
  end
  # describe 'validations' do
  #   it { should validate_presence_of(:subject) }
  #   it { should validate_presence_of(:message) }
  #   it { should validate_presence_of(:user_id) }
  # end

  describe 'validations' do
    it 'is not valid without subject' do
      contact = FactoryBot.build(:contact, subject: nil)
      expect(contact).not_to be_valid
    end
    end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
    end

end