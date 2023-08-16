require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  include Devise::Test::ControllerHelpers
  before do
    assign(:posts, [FactoryBot.create(:post)])
  end

  it 'renders a list of posts' do
    render
    expect(rendered).to have_content('Post Title')
    expect(rendered).to have_content('Post Body')
  end
end