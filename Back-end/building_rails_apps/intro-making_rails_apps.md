Lifecycle of a Rails App: User  -> Router (grabs specific controller and method in the controller) 
                                -> Controller (goes to specific Model)
                                -> Model (grabs needed data from database)
                                -> Back to Controller (sent to the corresponding view)
                                -> View (shows page)

Helpers
  To start building a new app: rails new *filename* --database=*database type*  
                                e.g. rails new twdir_app --database=postgresql
                               #make sure to name databases as *name*_development

  To run: rails server


Building a Rails App:  Model -> Routes(Router) -> Controllers -> Views

Important folders
  app
    -controllers
    -views
    -models
  config
    -database.yml (where rails will look for db's)
    -routes.rb
  db
  log
  test

note on database migrations -
  file name (normally): *timestamp*_class_name.rb

  Steps:
  Make sure new db is pointed to in database.yml folder OR 
  Create DB: 
  CMD Line: rake db:create
            rails generate migration *Class*(singular) i.e. rails generate migration Article
  Add to folder: db -> migrate -> *timestamp*create_*class*: t.text/integer(:*schema column name(s)*)
        for foreign keys, use t.references : *class*
  CMD Line: rake db:migrate

  #To wipe database, rake db:migrate:reset
  #To seed a file, write a seed.rb file with active_record statements, then rake db:seed from app's main folder

Add gems:   Go to 'Gemfile' file and add: gem 'pry-rails'               pry for rails
                                          gem 'HTTParty'                for APIs
                                          gem 'awesome_print'           makes hashes look nicer       
            CMD Line: Bundle install


models
  has_many/belongs_to/has_and_belongs_to_many :*database table*
  validates/validates_presence_of/validates_uniqueness_of/... :*database column*, ...

    When adding api's: Create a new api model 

        class *api*
          def self.search(*term searched for*)
            search_url = URI.escape("*api url search string #{*term searched for*}*")
            api_response = HTTParty.get(search_url)
            results = JSON.parse(api_response)["*name of the api's search key*"]
            #If the api requires ...
              # results_array = []
              # results.each do |r|
              # make an api call
              # store results in the results_array
          end

          
          search_results_hash = JSON.parse(*variable name*)
          search = search_results_hash['*key wanted*']
        end


routes
  file name : routes.rb
  Top line - Rails.application.routes.draw
  format: root '*class*#index'
          resources :*class*, ...
          USED TO BE: get/post/put/delete *file path  =>  *class of the object*#*method*
  No longer needs erb references (but still needs redirects_to)

  THE 7 ROUTES
    JOB               VERB            PATH                   JOB
    INDEX             GET             '/*things*'            show all
    SHOW              GET             '/*things*/:id'        show one
    NEW               GET             '/*things*/new'        show a form to make a new thingg
    CREATE            POST            '/*things*/'           make a new thing
    EDIT              GET             '/*things*/:id/edit'   show form for editing
    UPDATE            PUT             '/*things*/:id'        update thing
    DESTROY           DELETE          '/*things*/:id'        destroy thing


controllers 
  CMD Line: bin/rails generate controller *Class*(downcase & plural) i.e. bin/rails generate controller articles

  file name : *name(make it plural)*_controller.rb
  Top line - class *Name*Controller < ApplicationController
  Second line protects from CSRF attacks
  format: methods
  No longer needs erb references (but still needs redirects_to)
  update methods should use a .permit method to specify what arguments the user can put

views
  *name*.html.erb
  index
    add link

  show

  new
    errors
    form
    links

  edit
    errors
    form
    links

