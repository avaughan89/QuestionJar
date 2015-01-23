get '/' do
  erb :login
end

# user.surveys.find(1).responses find!
# user.surveys.create(title: "gold club", question: "wanna gold club?") Link!
#--------------------------------SESSIONS-------------------------

get '/sessions/new' do
  erb :login
end

# registration route
post '/sessions' do
  user = User.find_by(email:params["email"])
  if user.password = params["password"]
    session[:user_id] = user.id
    redirect '/'
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
  user= User.new(params[:user])
  if user.save
    session[:id] = user.id
    redirect '/login'
  else
    erb :login
  end
end

get '/users/:id' do
  erb :home
end


#------------Survey -------
post '/users/:id/surveys' do
  user = User.find(params[:id])
  survey = Survey.create(params[:question])
  user.surveys << survey
  erb :end
home

get '/users/:user_id/surveys/:survey_id' do

  erb :survey
end

get 'surveys/:id/reponses' do
  # @user = User.find(session[:id])

  # Response.create(user_id: session[:id] survey_id: params[id], response: params[:response])
end
