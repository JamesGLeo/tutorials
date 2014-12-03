In editor: 
    Gemfile ->  gem 'bourbon'  
                gem 'bitters'
                gem 'neat' 

In terminal ->  bundle install
                mv app/assets/stylesheets/application.css app/assets/stylesheets/application.css.scss

In editor:
    Make 'styles.css.scss'
    app/assets/stylesheets/application.css.scss ->  Delete everything
                                                    Add: 
@import "bourbon/bourbon";
@import "home";
@import "users";

@import "base/base";
@import "neat/neat";
@import "styles";

In terminal (apps/assets/stylesheets) ->  bourbon install
                                          neat install
                                          bitters install

