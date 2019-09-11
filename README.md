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
6. Run `rails db:setup`
7. Run `rails s`
8. Open your browser and go to `http://localhost:3000`
