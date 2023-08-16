require 'rails_helper'
RSpec.describe RatingsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    sign_in(user)
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new, params: { post_id: post.id }
      expect(response).to be_successful
    end
  end


end