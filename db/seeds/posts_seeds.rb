# frozen_string_literal: true

require 'faker'

class PostsSeeds
  def perform
    posts = [*1..5].map do |index|
      Post.new(
        user_id: index <= 3 ? 1 : 2,
        title: Faker::Lorem.words(number: [*2..6].sample).join(' '),
        message: Faker::Lorem.paragraphs(number: [*2..6].sample).join(' ')
      )
    end
    posts.each { |post| puts 'User save failed' unless post.save }
  end
end
