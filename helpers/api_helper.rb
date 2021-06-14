# Creates a hash as required by the Marvel API
def create_md5_hash(ts, privateKey, publicKey)
    hash = Digest::MD5.hexdigest "#{ts}#{privateKey}#{publicKey}"
    return hash
end

def get_characters_from_marvel(query)
    endpoint = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=#{query}"
    call_Marvel_api(endpoint)
end

def get_character_info(marvel_id)
    endpoint = "https://gateway.marvel.com:443/v1/public/characters/#{marvel_id}?"
    call_Marvel_api(endpoint).first 
end

def call_Marvel_api(endpoint)
    publicKey = ENV['MARVEL_API_PUBKEY']
    privateKey = ENV['MARVEL_API_PRIVKEY']
    ts = Time.now.getutc
    hash = create_md5_hash(ts,privateKey,publicKey)
    limit = 100
    endpoint += "&apikey=#{publicKey}&ts=#{ts}&hash=#{hash}&limit=#{limit}"
    response = HTTParty.get(endpoint)
    results = response["data"]["results"].to_a
end