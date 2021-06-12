# Creates a hash as required by the Marvel API
def create_md5_hash(ts, privateKey, publicKey)
    hash = Digest::MD5.hexdigest "#{ts}#{privateKey}#{publicKey}"
    return hash
end