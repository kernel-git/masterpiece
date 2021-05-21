require 'faker'

class PostsSeeds
  def perform
    posts = [*1..5].map do
      Post.new(
        user_id: 1,
        title: Faker::Lorem.words(number: [*2..6].sample).join(' '),
        message: Faker::Lorem.paragraphs(number: [*2..6].sample).join(' ')
      )
    end
    posts.each { |post| puts 'User save failed' unless post.save }
  end
end