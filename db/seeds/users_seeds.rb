# frozen_string_literal: true

require 'faker'

class UsersSeeds
  def perform
    @user1 = User.new({
                        nickname: 'anon',
                        email: 'test@example.com',
                        password: '111111',
                        password_confirmation: '111111'
                      })
    puts 'User save failed' unless @user1.save
    @user2 = User.new({
                        nickname: 'johndoe',
                        email: 'johndoe@example.com',
                        password: '111111',
                        password_confirmation: '111111'
                      })
    puts 'User save failed' unless @user2.save
  end
end
