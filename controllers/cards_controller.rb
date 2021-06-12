get '/cards' do

    results = get_search_results()
    p results
    erb :'cards/show', locals: {results: results}
  
end
    
def get_search_results()
    publicKey = ENV['MARVEL_API_PUBKEY']
    privateKey = ENV['MARVEL_API_PRIVKEY']
    ts = Time.now.getutc
    hash = create_md5_hash(ts,privateKey,publicKey)
    limit = 100
    all_cards = "https://gateway.marvel.com:443/v1/public/characters?apikey=#{publicKey}&ts=#{ts}&hash=#{hash}&limit=#{limit}"
    response = HTTParty.get(all_cards)
    results = response["data"]["results"].to_a
end