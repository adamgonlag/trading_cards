get '/marketplace' do 
    # if search used
    if params["query"] 
        query = params["query"]
        results = get_characters(query)
    else
        results = all_characters()
    end
    erb :'characters/index', locals: {results: results}
end

get '/character/create' do
    if params[:query]
        query = params["query"]
        # get results from Marvel API
        results = get_characters_from_marvel(query)
    end
    erb :'characters/create', locals: {results:results}
end


get '/character/:id' do 
    id = params[:id]

    # get character from db
    result = character_by_id(id)

    # get available cards of this character
    cards = get_available_character_cards(id)
    p cards

    erb :'characters/show', locals: {result:result, cards:cards}
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





