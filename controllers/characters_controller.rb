get '/marketplace' do 
    # get characters from db
    results = all_characters()
    p results
    erb :'characters/index', locals: {results: results}
end

get '/character/create' do
    erb :'characters/create'
end

get 'character/:id' do 
    id = params[:id]
    # get character from db
    result = character_by_id(id)

    erb :'characters/show', locals: {result:result}
end

get '/character/search' do
    query = params[:query]

    # get results from Marvel API
    results = get_characters(query)
    p results
    erb :'characters/results', locals: {results:results}
end

get '/character/new/:marvel_id' do
    marvel_id = params[:marvel_id]
    if marvel_id == "custom"
        character_info = nil
    else
    # populate form by calling Marvel API
    character_info = get_character_info(marvel_id)
    end
    
    erb :'characters/new', locals: {character_info:character_info}
end

get '/character/edit' do
    erb :'characters/edit'
end

post '/character/new' do
    name = params[:name]
    marvel_id = params[:marvel_id]
    price = params[:price]
    quantity = params[:quantity]
    backstory = params[:backstory]
    image_url = params[:image_url]
    num_comics = params[:num_comics]    
    # add character to the db
    create_character(name, marvel_id, price, backstory, image_url, quantity, num_comics)

    redirect '/'

end





