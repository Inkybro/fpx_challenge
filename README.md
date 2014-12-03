Fpx Challenge
================

We'd like to thank you for taking the time to interview with Floorplan Xpress.
In order to let us get a feel for an applicant's coding level and style, we've
thrown together a rather bare-bone application - but it sadly doesn't have much
functionality yet. That's where you come in.

The To Do List below re-creates a few every day (and some not-so-every-day)
tasks that an experienced developer might be assigned when working for us.
We'll be looking for task completion, but also for style and problem-solving methods,
so that we can better understand what we could hypothetically ask from, as well as
learn from, you.

A seed file is provided (app/db/seeds.rb) with some sample dealers to populate
the database, and can be run from the command line with the command 'rake db:seed'.
Feel free to add to this file to seed the database with units once you've added
them as well.

Please feel free to let us know if any of the steps are unclear and we'd be
happy to help.


To Do List
-----------

1. Add missing presence and length validations for Dealer#zip (see
   db/migrate/20141130205552_create_dealers.rb for length)

2. Add custom Dealer#zip= setter that strips out non-digit characters
   (73129-0001 should be saved as 731290001)

3. Add a _form partial to the dealers view folder, and include it in both the new
     and edit views. Use Rails helpers or simple_form to create the form fields.

3. Add a Unit model (required attributes should include Vin - Year - Make - Model)
    a. Add associations so that a dealer is connected to their units
    b. Edit the dealer show page so that it displays a list of that dealer's units.
    c. For extra points, fully flesh out a units controller with all CRUD actions
         and accompanying specs (passing, preferably).

4. Update the DealersController index and show actions to respond to requests for JSON and XML.

5. Create a method in the Dealer model that will return a list of other dealers
     within the same city - excluding the current dealer.

6. If you run the specs, you'll see that we have one failing test. Our Dealer#full_address
     method should be able to handle dealerships that don't have a street address
     listed (just city, state, zip). However, currently it returns an ugly leading
     character when no street address is given.

   Change the method (not the test) so that the test will pass.

7. If you'd really like to wow us, add an API token field to User, and require
     token_auth for JSON and XML requests.


Ruby on Rails
-------------

This application requires:

- Ruby 2.1.3
- Rails 4.1.6

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).
