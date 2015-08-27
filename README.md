# movieNumbers
Project #3: Building My Own API

Using Sinatra to build an API on Movies and the financial figures. The interest in finding out the top movies according to budgets.

Ideation: The content my API holds within a single model are movie name, movie release year, production budget, and world wide gross all inside one table.

As of this stage of the project, security for API through authentication will be through an API key or a user sign in.

Outside sources such as OMDB and the-numbers.com have existing APIs but are limited with access. This project will improve upon the existing APIs currently available after certain requirements are met.

Researching how to enable CORS (Cross Origin Requests) is still a process. The initial plan is to use a gem such as sinatra-cross-origin in able to give the permission/access when the client side is making a requests such as an ajax call which would automatically use the preflight info.
