# Angotia Resources
Angotia Resources is web site that gives each Angotia player possibility to check out all game data like npc, mob, items, quests and maps. Its also really hopefull for World Creators


## Installation (client)
- clone repository to your PC
- go to /client directory and run `npm install` command to get all packages
- run `npm start` command to listen React
- application is running on `http://localhost:3000`


## Installation (API)
- clone repository to your PC
- run `mix deps.get` to get all dependences
- run `mix mhx.server` to listen application
- right now application is running on `http://0.0.0.0:4000` and graphQL CLI is running on `http://0.0.0.0:4000/graphiql`


## Changelog

### Version 1.0.0 (planned June 2021)
- AC-94, Rename app from Angotia Catalogs to Angotia Resources
- AC-97, Add option to querying requested data by author
- AR-108, Add `combined_layers_blob` to Map and RequestedMap schemas
- AR-111, Rename subsoil to terrain
- AR-112, Rename char move, choosed and aggressiveness

### Version beta 1.2.0 (27 January 2021)
- AC-81, Add option to accepting requested items to production mode
- AC-76, Fix all errors and warnings in React Console
- AC-89, Add error handling during get not existing item
- AC-86, Fix scrolling issue at Map category
- AC-88, Update Elixir and Phoenix
- AC-90, Style Admin Panel tables
- AC-80, Add ability to decline requested item in Admin Panel
- AC-87, Replace fake data in Admin Panel by Angotia Resources API
- AC-82, Create requested data type in AC API
- AC-84, Create Admin Panel view
- AC-78, Create Admin Login view


### Version beta 1.1.0 (26 August 2020)
- Connect real data requested Maps and Chars to Admin Panel
- Redesign client visualisation layer
- Make descriptions unrequired (by default set them to empty string)
- Handle error while updating not existing map, quest, mob or char
- Map description and map background are no longer required fields in API
- Change credits footer design
- Render API info at root path
- Create a new, more intuitive Item Results Popup
- Handle error while deletion not existing map, quest, mob or char
- Rewrite and redesign Item Results popup


### Version beta 1.0.0 (13 July 2020)
- Create a whole Elixir API connected to Production Database. It replaces all hardcored data by real game content
- Set up production Angotia Database
- Replace hardcored data by AC API
- Create version bar
- Create report issue bar


### Version alpha 1.0.0 (19 March 2020)
- Create main panel
- Add categories: npc, mob, se, item, quest and map
- Create filters and search bar

