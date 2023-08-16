require 'rails-controller-testing'

RSpec.describe "Routes", type: :routing do
  describe "posts" do
    it "routes to posts#index" do
      expect(get: "/posts").to have_route(controller: "posts", action: "index")
    end

    it "routes to posts#show" do
      expect(get: "/posts/1").to have_route(controller: "posts", action: "show", id: "1")
    end

    # Add more route tests here
  end

  describe "contacts" do
    it "routes to contacts#new" do
      expect(get: "/contacts/new").to have_route(controller: "contacts", action: "new")
    end

    it "routes to contacts#create" do
      expect(post: "/contacts").to have_route(controller: "contacts", action: "create")
    end

    # Add more route tests here
  end

  # Add more describe blocks for other resources or routes
end
