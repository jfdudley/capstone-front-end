# DIY Skincare App
This app was created as a Capstone project for Ada Developer Academy Cohort 17. The purpose of the app is track skincare recipes, molds for forming solid products, and adjust recipe ingredient amounts based on users' mold selections. It was designed to assist my own hobby of making skincare products. 


## Feature Set

### Recipe Listings
Shows a list of all recipes stored in the database, with each individual recipe having a detail page with ingredients, instructions, and categorization information. From each individual recipe page, users can select the molds they would like to use when making the recipe, and the amounts of each ingredient will adjust based on those selections. A toolbar allows for quick navigation back to the home page from both the recipe list and recipe detail views. 

### New Recipe and Mold Forms
Users can also add new recipes and new molds from the home page. Forms cannot be submitted until all information is provided. Upon submission, new molds and recipes will be immediately available in the recipe and mold listings.

### User Profile (non-functional)
Original planning for this project included multi-user functionality, with accounts where users could favorite recipes, favorite molds, and possibly even save specific recipe-mold combinations. Ultimately, this was dropped as it was not achievable within the time allowed for the project. There is a nonfunctional login button on the home page, and user account button on the toolbar. 


## Dependencies
The DIY Skincare App relies on:

- Heroku Database
- User Input

## Environment Set-up

### Xcode Installation
Xcode is a developer toolset for creating apps for iOS devices. Any changes to the front end of the app must be made in Xcode. Xcode is available as a free download from the Mac App Store. There are no additional package requirements to run the front end of the app in Xcode, simply fork or clone this repository, and open the files in Xcode. From there, the app can either be run in a simulator or built on a device connected by USB.  

This app was designed for mobile phone use, specifically tested on an iPhone 12 mini. It was not designed for use on a computer, iPad, or Apple Watch. 


### Heroku Database
This app is currently a registered with the deployed backend database (separate repo) hosted on Heroku so no action needs to be taken to create a database. 

To connect the app to a local database, or a different database, update the url of the APIManager file, in the Model folder. 




