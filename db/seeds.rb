5.times do |t|
  User.create(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password_hash: Faker::Internet.password
    )
end


user = User.first
5.times do |t|
  user.surveys.create(
    title: Faker::Lorem.sentence,
    question: Faker::Lorem.sentence
  )
end

  5.times do |t|
    user.responses.create(
      response: true
      )
  end
