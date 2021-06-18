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

    results = run_sql( sql_query, params )
    if results.to_a.length > 0
        return results[0]
    else
        return nil
    end
end

def update_user(user_id, username, email)
    params = [user_id, username, email]
    sql_query = "UPDATE users SET username = $2, email = $3 WHERE id = $1;"

    run_sql( sql_query, params )

end

def get_balance(user_id)
    sql_query = "SELECT total_tokens FROM users WHERE id = $1;"
    run_sql( sql_query, [user_id]).first
end

def update_buyer_balance(buyer_id, price)
    balance =  get_balance(buyer_id)
    new_balance = balance["total_tokens"].to_i - price
    params = [buyer_id, new_balance]
    sql_query = "UPDATE users SET total_tokens = $2 WHERE id = $1;"
    run_sql( sql_query, params)
end

def update_seller_balance(seller_id, price)
    balance =  get_balance(seller_id)
    new_balance = balance["total_tokens"].to_i + price
    params = [seller_id, new_balance]
    sql_query = "UPDATE users SET total_tokens = $2 WHERE id = $1;"
    run_sql( sql_query, params)
end
