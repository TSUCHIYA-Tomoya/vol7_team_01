Rails.application.routes.draw do
  get 'conferences/show'
  get 'home/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => "home#top"
  post '/create' => "home#create"
end
