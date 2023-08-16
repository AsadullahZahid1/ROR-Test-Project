
require 'httparty'
class FetchDataFromApi

  def self.data
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
    posts_data = JSON.parse(response.body)

    posts_data.each do |post_data|
      post.create(body: post_data["body"], title: post_data["title"])
    end
  end
end