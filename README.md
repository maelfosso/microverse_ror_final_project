# Final Project

This project brings all the core functionnality of rails framework into practice through a basic implementation of Facebook webapp.
It is part of [Microverse](https://www.microverse.org/) curriculum.

# Authors

- Fabien RAKOTOMAMPIANDRA _https://github.com/FabienNeibaf_
- Mael FOSSO _https://github.com/maelfosso_

# Installation

1. Install **PostgreSQL**. Follow that [link](https://www.2ndquadrant.com/en/blog/pginstaller-install-postgresql/) or that [one](https://hostadvice.com/how-to/how-to-install-postgresql-database-server-on-ubuntu-18-04/)
2. If you're using Ubuntu, you still need to run these two commands to avoid some errors
    - `sudo apt-get install python-psycopg2`
    - `sudo apt-get install libpq-dev`
3. Connect to the adminstration console through `su - postgres` and then `psql`
4. Create a new role called **microverse_ror_final_project** with password *microverse* using `create role microverse_ror_final_project with createdb login password 'microverse';`
5. Run `bundle install`
6. The integration test uses **capybara-webkit**. When running **bundle install** this gem will require some native extensions like Qt and others.  
Follow the instruction given here if facing difficulty on installing them:  _https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit_.
7. Run `rails db:setup`
8. Run `rails s`
9. Open your browser and go to `http://localhost:3000`

# Testing

The project uses RSPEC for testing.  
As the integration test is done via *capybara-webkit*, in order to run the test inside *features* folder you need to run rspec prefixed by `xvfb-run -a` command.  
- `rspec spec/models` and `xvfb-run -a rspec spec/features`  
    *or just:*
- `xvfb-run -a rspec` to run all tests in the same time.
