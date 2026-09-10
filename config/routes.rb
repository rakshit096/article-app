Rails.application.routes.draw do
 resources :articles                              
end






# Note
# Only generate index, show, new, and create routes
# resources :articles, only: [:index, :show, :new, :create]

# Generate all routes except destroy
# resources :articles, except: [:destroy]