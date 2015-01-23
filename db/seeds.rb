
#create two users.
2.times do |t|
  User.create(
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password_hash: Faker::Internet.password
    )
end


# users = User.all


# users.each do |user|
#   2.times do #create four surveys
#     user.surveys.create(survey_title: Faker::Lorem.sentence);
#   end
#   2.times do #create four responses to 2 users.
#     user.responses.create(user_id: user.id, boolean: true);
#   end

# all_surveys = Survey.all
# all_questions= Question.all

#   all_surveys.each do |survey|
#     2.times do #create 8 questions to surveys.
#       survey.questions.create(user_id: user.id, inputted_question: Faker::Lorem.sentence)
#     end
#       # questions.each do |question|
#       #   2.times do
#       #     question.responses.create(user_id: user.id, boolean: true)
#       # end
#   end
# end


# surveys = Survey.all

# surveys.each do |survey|
#   5.times do |t|
#     survey.questions.create(inputted_question: Faker::Lorem.sentence)
#   end

