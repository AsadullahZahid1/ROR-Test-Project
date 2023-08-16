require 'rails_helper'
require 'httparty'

RSpec.describe FetchDataFromApi, type: :class do
  describe '.data' do
    it 'fetches and creates posts from the API response' do
      # Stub the HTTParty response
      response_body = [{ "title" => "Post 1", "body" => "Body 1" }]
      allow(HTTParty).to receive(:get).and_return(double(body: response_body.to_json))

      expect {
        FetchDataFromApi.data
      }.to change(Post, :count).by(0)

      expect(Post.last.title).to eq("Post 1")
      expect(Post.last.body).to eq("Body 1")
    end
  end
end