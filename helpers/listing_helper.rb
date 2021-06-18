def has_balance_for_purchase?(user_id, price)
    balance =  get_balance(user_id)

    if balance["total_tokens"].to_i >= price
        return true
    else
        return false
    end

end

def get_current_user_balance()
    user = current_user()
    balance = get_balance(user["id"])
    return balance["total_tokens"]

end

