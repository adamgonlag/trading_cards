get '/login' do
    erb :'sessions/login', locals: { error_message: ''}
end

post '/sessions' do
    email = params[:email]
    password = params[:password]

    user = find_user_by_email( email )

    if user && BCrypt::Password.new(user['password_digest']) == password
        session[:user_id] = user['id']
        redirect '/'
    else 
        erb :'/sessions/login', locals: { error_message: 'Incorrect email or password' }
    end

end

get '/logout' do 
    session[:user_id] = nil
    redirect '/'
end