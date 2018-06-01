![App Screenshot](../master/public/blogapp.png)

# mini-blog-app
Built an app that allows authenticating User to post their own blog. 
- The user can SignUp, SignIn, Sign out, Edit and Delete their account. 
- A user can see a profile page with all of their account details and micro-blog posts. 
- See a page with the 10 most recent posts (the “feed”).

## Key features

###### - Use session to keep track of currunt User and their related data
###### - User can delete their account and post related to it
###### - User can see blog of other Users
###### - Use Sinatra Flash for display message on diffrent page 

> The flash is a handy little helper method in Rails that lets you store information between requests. When your application 
> processes a request, it usually ends by redirecting to another url, which generates another request. The flash is a hash-
> like object that stores temporary values such as error messages so they can be retrived later – usually on the next request.  It also removes the information once it has been used.

## Installation

First of all we need to install the sinatra-flash gem, like so:

> gem install sinatra-flash 

or add in you gemfile
> gem sinatra-flash

after that in you command line 
> run bundle install

one last thing is to use flash we have to use require in our main.rb file

> require 'sinatra'

> require 'sinatra/flash'

#### That's it you all set to use Sinatra flash in your project

###### Syntax

simple exapmple how to use sinatra flash.
![App Screenshot](../master/public/flashex.png)


