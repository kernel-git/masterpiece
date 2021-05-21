Rake::Task['db:reset'].invoke

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end
UsersSeeds.new.perform
PostsSeeds.new.perform