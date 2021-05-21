require 'faker'

class UsersSeeds
  def perform
    @user = User.new({
      nickname: 'anon',
      email: 'test@example.com',
      password: '111111',
      password_confirmation: '111111'
    })
    puts 'User save failed' unless @user.save
  end
end