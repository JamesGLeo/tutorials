

###Create ALL the files and folders we will need:
```bash
mkdir lemmer
cd lemmer

# This is ME!  The file you're reading now!
touch readme.md  

mkdir views # erb files to be rendered
touch views/layout.erb  # every page html and yield
touch views/index.erb   # welcome page

mkdir views/users   # all the views related to the user resource
touch views/users/new.erb  #  signup form
touch views/users/profile.erb  #  show page for the signed in user

mkdir views/sessions   # all the views related to the session
touch views/sessions/login.erb  # login form

mkdir views/partials  # all the partial view components
touch views/partials/_user_navigation.erb   # logged in nav bar
touch views/partials/_non_user_navigation.erb # non-logged in nav bar

mkdir public  #  Assets to be accessible without writing routes

mkdir public/images  # publicly available images

mkdir public/stylesheets #  publicly available css
touch public/stylesheets/styles.css   #  the style sheet css

mkdir public/javascripts  #  publicly available js files
touch public/javascripts/scripts.js  #  the scripts for the app

mkdir models  # model definitions
touch models/user.rb # class User < ActiveRecord::Base
touch models/lem.rb # class Lem < ActiveRecord::Base

mkdir controllers # application logic... broken into resource specific files
touch controllers/application_controller.rb  # General logic
touch controllers/welcome_controller.rb # Welcome logic
touch controllers/users_controller.rb # Users logic
touch controllers/sessions_controller.rb # Sessions logic
touch controllers/lems_controller.rb # Lems logic

mkdir helpers # Application methods to help...
touch helpers/authentication_helper.rb  # methods to help manage authentication

touch config.ru  # maps routes to controllers and loads dependencies
touch Rakefile  # Defines raketasks
touch Gemfile  # List dependencies gems
touch connection.rb  # Establish a connection to a database
```

---

####Create the database
```sql
psql
CREATE DATABASE lemmer;
\q
```

---

####Create migrations
```ruby

rake db:create_migration NAME=create_users
rake db:create_migration NAME=create_lems
rake db:create_migration NAME=add_created_at_index_to_lems

```
---

###Diretories and Files code-generated:
- db/
  - `schema.rb`  Current state of database... given the version of migration currently on
  - migrate/
    - `20141029153122_create_lems.rb`   # create table lems
    - `20141029153125_create_users.rb` # create table users
    - `20141029185101_add_created_at_index_to_lems.rb`  # add an database index


---

###Manually downloaded LemLem image and jquery into their respective folders
- public/
  - images/
    - `LemLem.png`
  - javascripts/
    - `jquery.js`
  - congruent_pentagon/
    - `congruent_pentagon.png`
    - `reademe.txt`
---
