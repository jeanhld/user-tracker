Rails.application.routes.draw do
  root 'contacts#index'
  resources :visitors do
    resources :contacts, :only => [:show, :create]
  end
end
