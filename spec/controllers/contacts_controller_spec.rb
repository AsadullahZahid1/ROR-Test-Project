require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }


  describe 'POST #create' do


    context 'when user is not authenticated' do
      it 'redirects to the sign-in page' do
        post :create, params: { contact: { subject: 'Test Subject', message: 'Test Message' } }
        expect(response).to redirect_to(new_User_session_path)
      end
    end
  end
end