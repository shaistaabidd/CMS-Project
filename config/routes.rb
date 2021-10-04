Rails.application.routes.draw do
  
  #get 'section/index'
  #get 'section/show'
  #get 'section/new'
  #get 'section/edit'
  #get 'section/delete'
  root 'demo#index'
  #get 'subjects/index'
  resources :subjects do

    member do
      get :delete
    end
  end

  resources :sections do

    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
