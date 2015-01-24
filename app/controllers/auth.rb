get '/' do
  erb :login
end

# user.surveys.find(1).responses find!
# user.surveys.create(title: "gold club", question: "wanna gold club?") Link!
#--------------------------------SESSIONS-------------------------

get '/sessions/new' do
  erb :login
end

# login route
post '/sessions' do
  user = User.find_by(email: params[:email])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil
  redirect '/'
end

#----------USERS --------

get '/users/new' do
  @user = User.new
  erb :login
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:id] = user.id
    redirect '/'
  else
    erb :login
  end
end
# User Home Page: (1) create new survey (2) see all your surveys (3) see all sureveys
get '/users/:id' do
  @user = User.find(session[:user_id])
  @surveys = Survey.all
  erb :home
end


#------------Survey -------
  #-Create -------
post '/users/:id/surveys' do
  @user = User.find(params[:id])
  survey = Survey.create(question: params[:question], user_id: @user.id, title: params[:title])
  @surveys = Survey.all
  @user.surveys << survey
  erb :home
end
#-Take Survey -------
get '/users/:user_id/surveys/:survey_id' do
  @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])
  @responses = Response.where(survey_id: @survey.id)
  p @responses

  erb :survey
end

#-Respond to Survey -------
# Old
# post '/users/:user_id/surveys/:survey_id' do
#   @user = User.find(params[:user_id])
#   @survey = Survey.find(params[:survey_id])
#   Response.create(user_id: @user.id, survey_id: @survey.id, response: params[:response])

#   redirect "/users/#{@user.id}/surveys/#{@survey.id}"
# end

post '/users/:user_id/surveys/:survey_id' do
  @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])
  p params
  Response.create(response: params[:res])
  content_type :json

  {res: params[:res]}.to_json
  # {response: @response.response}.to_json
  # "hello"
end


#-Delete Survey -------

delete '/users/:user_id/surveys/:survey_id' do
  @user = User.find(params[:user_id])
  Survey.find(params[:survey_id]).destroy

  redirect "/users/#{@user.id}"
end

get '/users/:user_id/surveys/:survey_id/reponses' do
  # @user = User.find(session[:id])

  # Response.create(user_id: session[:id] survey_id: params[id], response: params[:response])
end


