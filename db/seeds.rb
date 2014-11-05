require 'faker'

10.times do
  hash = {
    content: Faker::Internet.url,
    votes: 0
  }
  Article.create(hash)
end
