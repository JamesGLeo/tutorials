Steps to full stack web app development

Back-end in Rails

  - Make new rails app:       terminal:   'rails new *filename* -T -d postgresql'

  - Create a new database:    terminal:   CD into the app's folder 
                              terminal:   Type in 'bin/rake db:create' 

  - Create a user model:      terminal:   bin/rails g model User
                              editor:     In folder db/migrate/"*datetime*_create_users.rb"
                                          Set tables with t.*datatype* :*tablename*

  - Set up the database       terminal:   'rake db:migrate'

  - Set up encryption gem     editor:     in Gemfile
                                          Uncomment bcrypt
                              terminal:   'bundle'

  - Set up user controller    terminal:   bin/rails g controller *name* *nameaction*
                              editor:     In users_controller
                                          At top ~> before_filter 

                                          Set up CRUD methods
                                          'def index'   'def show'  'def new' 'def create'  'def edit'  etc.
                                          'end'         'end'       'end'      'end'        'end'
                                          At bottom ~>    'def users_param'
                                                            ...
                                                          'end'
                                          
                                          In application_controller.rb
                                          def authorize
                                            redirect_to *path* unles current user
                                          end

                                          def current_user
                                            @current_user ||= User.find(session[:user_id] if session[:user_id])
                                          end

  - Set up routes             editor:     In config/routes.rb
                                          resources :users, only: [ :index, :show, :new, :edit ]

  - Set up views              terminal:   mkdir *appname*/app/views
                                          touch *appname*/app/views/*.html.erb (include a _form file for a form partial & a login view - make sure to include an authenticity token '<%= token_tag %>' if required by the gem)
                              editor:     make forms and pages and stuff

  - Setup sessions controller editor:     In sessions_controller.rb
                                          def login
                                            user = User.find_by({username: params[:username]})
                                            if user && user.authenticate(params[:password])
                                              session[:user_id] = user.id
                                              redirect_to user_path(user)
                                            else
                                              redirect_to new_user_path
                                            end
                                          end

                                          def logout
                                            session[:user_id] = nil
                                            redirect_to root_path
                                          end

  - Setup nav                 editor:     In view/layout
                                          <nav><% render partial if current_user? ... %></nav>

                                          Create _user & _non_user views
                                          Put them in a views/shared folder
                                          Explicitly tell app where to find these


  - Setup app's objects                   Set up CRUD methods
                                          Similar to usual but use 'current_user.' in front of actions
                                          &
                                          Add JSON functionality for def show, create, & destroy: 
                                                    ex.   def show
                                                          * usual code *
                                                            respond_to do |format|
                                                            fomat.html
                                                            format.json {render :json => {todo:@todo}
                                                          end

                                          At bottom ~>    private
                                                          'def users_param'
                                                            * usual code *
                                                          'end'




Front-end in JS

- Set up application.js       editor:     Control load order by - 
                                          changing 'require_tree .' to 'require_tree ./*objects*/controllers, models, views, etc.'

- Set up backbone-style constructors      editor: Make file - *thing*.js
                                                  var *Thing* = function *Thing() {}
                                                  
                                                  Make file - *thing*View.js
                                                  var *Thing*View = ...
                                                  *Thing*View.prototype.render = ...
                                                    (make sure to end with 'return this')

                                                  Make file - *thing*List.js
                                                    var *Thing*List = ...
                                                    *Thing*List.prototype.add = ...

                                                    *Thing*List.prototype.create = function create() {
                                                      var that = this;
                                                      $.ajax ({
                                                        method: 'POST',
                                                        url: '/*thing*',
                                                        dataType:'JSON',                                    data: { *thing*:*thing*Options },
                                                        success: function(data) {
                                                          var *thing* = new that.model(data.*thing*);
                                                          that.add(*thing*);
                                                        }            
                                                      })
                                                    }

                                                    *Thing*List.prototype.fetch = function fetch() {
                                                      var that = this;
                                                      $.ajax ({
                                                        method: 'GET',
                                                        url: '/*thing*',
                                                        dataType:'JSON',
                                                        success: function(data) {
                                                          that.models =[];
                                                          $(data.*thing*).each(function(idx,*thing*Option) {
                                                          var *thing* =new that.model(*thing*Option);
                                                          });
                                                          that.add(*thing*);
                                                        }            
                                                      })
                                                    }


                                                  Make file - *Thing*ListView.js
                                                    var *Thing*ListView = ...
                                                    *Thing*View.prototype.render = ...
                                                    (make sure to end with 'return this')

- Set up On Ready scripts               editor: *thing* = 