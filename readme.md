# Marvel Trading Cards

Marvel Trading Cards is an application that allows users to buy and sell Marvel character themed trading cards.

New cards can be added by an admin to the database by using the Marvel API to gather data (character name, backstory, images etc). Alternatively custom cards can be created.

The app uses a token money supply to keep track of card trades.

## Live Demo
- https://nameless-castle-77437.herokuapp.com/

## How it was built
- HTML
- CSS
- Sinatra backend
- Postgres

## Features
- Add new cards via the Marvel API
- User creation and authentication using Bcrypt
- User sessions
- Admin only features e.g. create new cards, delete cards etc.
- List cards for sale on a marketplace to make available to all users
- Sell cards to other users using token money.
- CRUD functionality for multiple resources.

## Planning
- https://www.figma.com/file/F9CfTjndvBBZvKdvXCJV1t/Marvel-Trading-Cards?node-id=0%3A1

## Future features
- Allow users to list cards and ask for a card they want to trade for. E.g. I wasnt to trade a Spider-man Edition 2, for a Thanos Edition 1.
- If a 1 for 1 trade cannot be agreed, allow a trade plus extra $$.
- Re-do the frontend using a framework, e.g. React
- Filter options for the Marketplace to allow easier searching