# Final Project

This project brings all the core functionnality of rails framework into practice through a basic implementation of Facebook webapp.
It is part of [Microverse](https://www.microverse.org/) curriculum.

# Authors

- Fabien RAKOTOMAMPIANDRA _https://github.com/FabienNeibaf_
- Mael FOSSO _https://github.com/maelfosso_

# Installation

1. Install **PostgreSQL**. Follow that [link](https://www.2ndquadrant.com/en/blog/pginstaller-install-postgresql/)
2. Connect to the adminstration console through `su - postgres` and then `psql`
3. Create a new role called **microverse_ror_final_project** with password *microverse* using `create role microverse_ror_final_project with createdb login password 'microverse';`
4. Run `rails db:setup`
5. Run `rails s`
6. Open your browser and go to `http://localhost:3000`
