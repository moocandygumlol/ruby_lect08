Rails.application.routes.draw do
  get 'st_score/home'
  get 'st_score/edit'
  get 'st_score/delete'
  post 'st_score/update'
  get '/student/:id/edit_score' ,to: 'st_score#home'
  get 'st_score/add'
  post 'st_score/success'
  resources :scores
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
