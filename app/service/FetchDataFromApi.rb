class FetchDataFromApi
  def self.data(p)
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
    posts_data = JSON.parse(response.body)

    posts_data.each do |post_data|
      p.posts.find_or_create_by(body: post_data["body"], title: post_data["title"])
    end
  end
end