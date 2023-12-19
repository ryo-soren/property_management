# Property Bros

## What is it?

Property Bros is a project created in a group of 4 for landlords to post their available rental properties for prospecting tenants. 

It was bootstrapped with [rails new property_management](https://guides.rubyonrails.org/getting_started.html)

## What does it do?

The website’s main features are for homeowners making rental property listings and tenants making application requests for those homes. There is an index page where all the properties are ordered by listing date. There is also a search bar for users to find properties with specific keywords. Users have the ability to ask questions about properties and the property owner can answer those questions. Landlords have access to features such as posting new properties, as well as the admin panel for a general overview of all the user’s properties. Tenants have access to their customer panel. There, users can see all of their applications and the status of it based on how it’s been handled by the property owner. 

## Notable Features

* Search Bar
  * Ability to search all properties in the database
  * Uses PSQL commands to search based on the property’s name, location, description, or amenities
  * The search is not case sensitive to allow for a broader search 
* Property View Page
  * Users can ask questions about the property, and only the property owner can answer the questions
  * Link to apply for a rental application to that specific property
* Admin Panel Page
  * Control panel for all the user’s listed properties 
  * Ability to view each rental application per listed property 
  * User has the choice to accept or reject the application on the property  
* Customer Panel Page
  * A page to track the all of the user’s applications and questions about properties
  * The user’s questions are at the top of the page listed in order of creation
  * The applications portion is split into 3 sections - Pending/Approved/Rejected
  * Users can expand and view the property they have submitted a rental application to, or properties have inquired on 

## How is it build?

* Group of 4
  * Role - Git Leader
* Front-End/Back-End
  * Ruby on Rails
* Styling
  * Bootstrap 5
  * ERB Templating 
  * sassc-rails
* Database
  * PostgreSQL
* Version Control
  * GitHub
* Dependencies
  * gem "pg", "~> 1.1"
  * gem "bcrypt", "~> 3.1.7"
  * gem "cancancan"
  * gem 'fastimage'

## Clone the repository

Follow the steps in [this link](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) to clone the repository

## Set up the project for development

### `bundle install`

Installs all dependencies required for the project's full functionality

### `rails s`

Runs the app in the development mode.
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.