Dashboard::Application.routes.draw do
  resources :assignments
  resources :contractors
  root :to => 'schedules#show'
end
