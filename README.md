# DM Tool
### By: Chris Kennelly

The back end of this project was actually a whole lot of fun to make. By scaffolding all the tables I needed in my database it was easy enough to get started. From there it was just figuring out how to route from one table to the next. Users `has_many` Campaigns, Campaigns `belongs_to` Users and `has_many` Encounters, Encounters `belongs_to` Campaigns and so on. Because I wanted everything authenticated and be driven by what user was already signed in, I hade to use route nesting to get the specific routes (everything through users) I needed.

One of my favorite things I discovered, was how to reject parameters from updating (turned out to be as simple as adding `.reject { |k, v| v.blank? }` which rejects all blank parameters).

Must bundle install.

## Tech
- Ruby on Rails & Ruby: Used to build the entire API

## Routes

| Prefix                   | Verb   | URI Pattern                                           | Controller#Action  |
|--------------------------|--------|-------------------------------------------------------|--------------------|
| sign_up                  | POST   | /sign-up                                              | users#signup       |
| sign_in                  | POST   | /sign_in                                              | users#signin       |
|                          | DELETE | /sign_out/:id                                         | users#signout      |
|                          | PATCH  | /change_password/:id                                  | users#changepw     |
| user_campaign_encounters | GET    | /users/:user_id/campaigns/:campaign_id/encounters     | encounters#index   |
|                          | POST   | /users/:user_id/campaigns/:campaign_id/encounters     | encounters#create  |
| user_campaign_encounter  | GET    | /users/:user_id/campaigns/:campaign_id/encounters/:id | encounters#show    |
|                          | PATCH  | /users/:user_id/campaigns/:campaign_id/encounters/:id | encounters#update  |
|                          | DELETE | /users/:user_id/campaigns/:campaign_id/encounters/:id | encounters#destroy |
| user_campaigns           | GET    | /users/:user_id/campaigns                             | campaigns#index    |
|                          | POST   | /users/:user_id/campaigns                             | campaigns#create   |
| user_campaign            | GET    | /users/:user_id/campaigns/:id                         | campaigns#show     |
|                          | PATCH  | /users/:user_id/campaigns/:id                         | campaigns#update   |
|                          | DELETE | /users/:user_id/campaigns/:id                         | campaigns#destroy  |



## Planning
# ERD
- (https://imgur.com/MEy78Fm)


## Links

- Back-end Repository: https://github.com/ChrisAK/wdi-project-2-dm-tool-api
- Front-end Repository: https://github.com/ChrisAK/wdi-project-2-dm-tool-front
- Back-end Deployed: https://dm-tool-api.herokuapp.com
- Front-end Deployed: https://chrisak.github.io/wdi-project-2-dm-tool-front


[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
