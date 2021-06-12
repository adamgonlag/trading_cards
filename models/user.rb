require 'bcrypt'

def create_user(username, email, password)
    total_tokens = 10000 #inital balance for all users
    is_admin = false #by default
    password_digest = BCrypt::Password.create(password)
    params = [username, email, total_tokens, is_admin, password_digest]
    sql_query = "INSERT INTO users(username, email, total_tokens, is_admin, password_digest) values($1, $2, $3, $4, $5);"
    run_sql(sql_query, params)
end

def find_user_by_email( email )
    find_user("email", email)
end

def find_user_by_id ( id )
    find_user("id", id)
end

def find_user(query, value)
    params = [value]
    sql_query = "SELECT * FROM users WHERE #{query} = $1;"

    p params
    p sql_query
    results = run_sql( sql_query, params )

    p results.to_a[0]
    if results.to_a.length > 0
        return results[0]
    else
        return nil
    end
end