Rails.application.routes.draw do
  devise_for :designers
  # Routes for the Designer resource:
  # READ
  get "/designers", :controller => "designers", :action => "index"
  get "/designers/:id", :controller => "designers", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
