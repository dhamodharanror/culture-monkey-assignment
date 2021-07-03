Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :employees, only: [:index, :create, :update, :edit, :new, :destroy]
  root 'employees#index'
end
