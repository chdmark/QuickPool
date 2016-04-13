# QuickPool

##Synopsis
Quickpool is a simple web applications that makes it easier to create carpools. When a user inputs the address of their starting and ending locations, they will be automatically connected with another commuter who has a similar route.

It is built with Ruby on Rails and utilizes GeoKit and Twilio functionality. Although it is not currently deployed, you may see a live version with installation instructions provided below.

##How to Use
Quickpool is an extremely easy to use application. After creating a simple profile, you are able to create a carpool request by inputting three fields: starting address, ending address, and whether you are a driver or rider. After submitting your request, Quickpool will search existing requests for a matches. Once you find a match, you will be notified by SMS and will be able to look at the updated request on your user profile.

![](/app/assets/images/request-ss.png)
![](/app/assets/images/pending-ss.png)

##How it Works
Using GeoKit API, we are able to convert the address inputted by the user into a GeoKit object that provides many built-in methods that can calculate longitude, latitude, and distance. Whenever a commute request is made, the application searches active requests for starting and ending addresses within 1 mile of the original request. Once found, the two matched requests in the Request Table are set ‘in-active’ and its information is used to create a Ticket.


##Origin
Quickpool was conceived for a civi-themed, one-day hackathon held at Dev Bootcamp San Francisco. The two topics for the hackathon were homelessness and transportation.

Two members of our team commute into San Francisco from the East Bay in sections where other carpooling apps were not available yet. To address this need we decided to create a platform that provides services to areas based on user need, rather than areas deemed most profitable by companies.

##Contributors
Quickpool was created by a four members of a hackathon team:
Chris Mark ([chdmark](https://github.com/chdmark)),
Afaan Naqvi ([afaan5556](https://github.com/afaan5556)),
Kosuke Tseng ([ctkochan22](https://github.com/ctkochan22)),
Shawn Watson ([its-swats](https://github.com/its-swats)).

##License
MIT License



