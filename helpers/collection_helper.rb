def any_listings_for_user?
    user = current_user()
    user_listings = get_listings_of_user(user["id"])
    p user_listings
    if user_listings.length > 0
        return true
    else
        return false
    end
end

def card_listed?(card_id)
    card = get_card_listing_by_card_id(card_id)

    p card
    if card && card["status"] == 'listed'
        return true
    else
        return false

    end
end

def is_current_user_owner?(card_id)
    card = get_card_by_id(card_id)
    user = current_user()
    
    if user && card && user["id"] == card["owner_id"]
        return true
    else
        return false
    end
end
