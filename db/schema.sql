CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    name TEXT,
    marvel_id TEXT,
    initial_price int,
    backstory TEXT,
    image_url TEXT,
    quantity_released int,
    date_created TIMESTAMP,
    num_comics int
);

CREATE TABLE cards (
    id SERIAL PRIMARY KEY,
    owner_id int,
    character_id int,
    card_edition int,
    available boolean,
    last_price_paid int,
    CONSTRAINT fk_character
        FOREIGN KEY(character_id) 
            REFERENCES characters(id),
    CONSTRAINT fk_users
        FOREIGN KEY(owner_id) 
            REFERENCES users(id)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT,
    total_tokens INT
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    listing_id int,
    user_id int,
    comment TEXT,
    CONSTRAINT fk_listings
        FOREIGN KEY(listing_id) 
            REFERENCES listings(id),
    CONSTRAINT fk_users
        FOREIGN KEY(user_id) 
            REFERENCES users(id)
);

CREATE TABLE listings (
    id SERIAL PRIMARY KEY,
    user_id int,
    card_id int,
    price int,
    buyer_id int,
    status TEXT,
    CONSTRAINT fk_cards
        FOREIGN KEY(card_id) 
            REFERENCES cards(id),
    CONSTRAINT fk_buyer_user_id
        FOREIGN KEY(buyer_id) 
            REFERENCES users(id),
    CONSTRAINT fk_owner_user_id
        FOREIGN KEY(user_id) 
            REFERENCES users(id)
);

