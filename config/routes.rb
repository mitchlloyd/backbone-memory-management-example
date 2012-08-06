Dashboard::Application.routes.draw do
  resources :assignments, only: 'create'
  root :to => 'schedules#show'
end
