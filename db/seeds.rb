5.times do |t|
  User.create(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password_hash: Faker::Internet.password
    )
end

5.times do |t|
  User.surveys.create(
    title: Faker::Lorem.sentence,
    question: Faker::Hacker.noun
    )
end

  5.times do |t|
    User.responses.create(
      response: true
      )
  end
