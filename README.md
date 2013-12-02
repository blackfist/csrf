== CSRF Demo App

This is a simple application to demonstrate how Rails implements Cross Site Request Forgery. The app itself is just a
list of things that users need to do along with some authentication that allows users to log in and add new items. 
When run like a normal app using `rails server` the normal out-of-the-box CSRF protections are in place. However, 
if an environment variable called CSRF is set to no `export CSRF="no"` then when the server is run the CSRF protection 
will not be in place.

To help demonstrate the functionality of the CSRF protection, a sample malicous link is included in a file called public/sample.html.
There are 3 ways you can use this to demonstrate the CSRF protection

1. Copy the code onto another domain that you control and access the page.
2. Access the page from the rails app by going to http://localhost:3000/sample.html. If you do that, you wont really be doing *Cross Site*
request forgery though.
3. Use the simple python script, malicious.py, to serve the script up on another port which is basically the same as doing it
from another domain.

One interesting thing is to look at the generated html code for http://localhost:3000/todos/new and see how it changes based on whether
or not the environment variable CSRF is set to no.

== Setup
This is a really simple Rails app, written in Rails 4. 
1. Git clone to some folder
2. Go into that folder and do `bundle install`
3. Then do `rake db:setup`
4. Then do `rails server`

You should be able to connect to http://localhost:3000 and see the app. 
A single user is created for you with username admin@this.com and password adminadmin.

== Demonstration
A rails app normally includes CSRF protection right out of the box. To disable the CSRF protection you can set an environment variable
called CSRF and set the value to no.

`export CSRF=no`

If the CSRF environment variable is set, and the value is no, then rails will not generate the csrf\_meta\_tag in the head
of the html and it the application controller will skip the verify\_authenticity\_token. Here is the code from 
app/view/application/layout.html.erb

    <% if ENV.has_key?('CSRF') %>
      <% if ENV['CSRF'].downcase != 'no' %>
        <%= csrf_meta_tags %>
      <% end %>
    <% else %>
      <%= csrf_meta_tags %>
    <% end %>

and here is the code from app/controllers/application\_controller.rb

    if ENV.has_key?('CSRF')
      if ENV['CSRF'].downcase == 'no'
        skip_before_action :verify_authenticity_token
      end
    end
 
 