Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
        collection do
          post :import
          get  :list
          get :fetch_data
          post :save_data
          get :list_article
        end
      end
end
