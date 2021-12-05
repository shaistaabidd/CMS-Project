Rails.application.routes.draw do
  
  get 'subject/index'
  get 'subject/show'
  get 'subject/edit'
  get 'subject/delete'
  get 'pages/index'
  get 'pages/show'
  get 'pages/new'
  get 'pages/edit'
  get 'pages/delete'
  #get 'section/index'
  #get 'section/show'
  #get 'section/new'
  #get 'section/edit'
  #get 'section/delete'
  get 'demo/escapes_output'
  get 'demo/strip_links'
  root 'demo#index'
  get 'all_pages',to: "subjects#showAllPages"
  #get 'subjects/index'
  resources :subjects do
    resources :pages do

      member do
        get :delete
      end
    end
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
