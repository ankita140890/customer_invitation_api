Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'customers', to: 'customers#create'
    end
  end
end
