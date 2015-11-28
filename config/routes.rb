Rails.application.routes.draw do
  root 'contacts#index'
  resources :visitors do
    resources :contacts, :only => [:show, :create]
    resources :visited_pages, :only => [:create]
  end
end
