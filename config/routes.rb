BlogPostApi::Application.routes.draw do

  # The project instructions indicate that we aren't destroying blog posts or 
  # categories, so restrict those abilities.

  with_options except: :destroy do |no_destroy|
    no_destroy.resources :posts
    no_destroy.resources :categories
  end

  # API Versioning Namespaces:
    namespace :v1 do
      resources :posts
      resources :categories
    end

    namespace :v2 do
      resources :posts
      resources :categories
    end

  # Below, we define a specific API namespace so our model/controller naming 
  # conventions don't get wild.

  # We're also restricting access to the API through the api.* 
  # subdomain for better load balancing options at the DNS level.
  # (This requires editing the HOSTS file in dev environments)

  # Commented out so anyone testing this app doesn't have to mess with Hosts

  #namespace :api, path: '/', constraints:{ subdomain: 'api' } do
  
end
