== CSRF Demo App

When it is done, this app will demonstrate how CSRF protection in rails works. When it's done.

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
 
 