# movieNumbers
## Project #3: Building an API

This is a project that involves using Sinatra to build an API about movies and the financial figures. Specifically, the interest is in finding out the top movies according to the budgets that were spent.

Ideation: The content my API holds within a single model are movie name, movie release year, production budget, and world wide gross all inside one table.
The project will include authentication for API.

### User Stories
Outside sources such as OMDB and the-numbers.com have existing APIs but are limited with access. This project will improve upon the existing APIs currently available after certain requirements are met.

##Installation Instructions
* Go to https://github.com/joegreene12/movieNumbers
  - copy ssh on the listed on right side of page
* In terminal:
  - git clone (SSH key)
* Create a database (Postgresql)  
* Save database Git add/commit
* Bundle exec rackup
* Go to localhost:9292/


## Technologies Used

* HTML5 & CSS
* Bootstrap
* Javascript
* Sinatra (Ruby)
* Postgres Database
* Active Record ORM
* jQuery
* Underscore.js
* Backbone.js
* PG Commander



Link to your user stories – who are your users, what do they want, and why?
Keep user stories small and well-defined, and remember – user stories focus on what a user needs, not what development tasks need accomplishing.

Link to your wireframe –
![alt image] (http://i.imgur.com/8iLZJEN.jpg)





## Known Issues
There were some challenges that had to be overcome as using Backbone.js for the first time was a major step personally in web development. Also, there were many debugging issues such as Active Record converting the currency into an integer. Also there was difficulty with choosing which way to go about api authentication.

Researching how to enable CORS (Cross Origin Requests) was a process. The end result was to use a gem such as sinatra-cross-origin in able to give the permission/access when the client side is making a request (ajax call).


For version 2.0, making the list more exhaustive, different categories (higest budget with lowest ROI/biggest flops), continue to utilize tools in Bootstrap.
