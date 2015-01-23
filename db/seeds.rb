5.times do |t|
  User.create(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password_hash: Faker::Internet.password
    )
end


users = User.all
surveys = Survey.all
# questions= Question.all

users.each do |user|
  5.times do
    user.surveys.create(survey_title: Faker::Lorem.sentence)
  end
  surveys.each do |survey|
    2.times do
      survey.questions.create(inputted_question: Faker::Lorem.sentence)
    end
    #   questions.each do |question|
    #     2.times do
    #       question.responses.create(user_id: user.id, boolean: true)
    #   end
    # end
  end
end

# surveys = Survey.all

# surveys.each do |survey|
#   5.times do |t|
#     survey.questions.create(inputted_question: Faker::Lorem.sentence)
#   end



questions = Question.all
questions.each do |question|
  5.times do |t|
    question.responses.create(boolean: true)
  end
end
