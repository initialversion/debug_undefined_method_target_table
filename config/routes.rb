Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "companies#index"
  # Routes for the Engagement resource:
  # CREATE
  get "/engagements/new", :controller => "engagements", :action => "new"
  post "/create_engagement", :controller => "engagements", :action => "create"

  # READ
  get "/engagements", :controller => "engagements", :action => "index"
  get "/engagements/:id", :controller => "engagements", :action => "show"

  # UPDATE
  get "/engagements/:id/edit", :controller => "engagements", :action => "edit"
  post "/update_engagement/:id", :controller => "engagements", :action => "update"

  # DELETE
  get "/delete_engagement/:id", :controller => "engagements", :action => "destroy"
  #------------------------------

  devise_for :clients
  # Routes for the Client resource:
  # READ
  get "/clients", :controller => "clients", :action => "index"
  get "/clients/:id", :controller => "clients", :action => "show"


  # Routes for the Assignment resource:
  # CREATE
  get "/assignments/new", :controller => "assignments", :action => "new"
  post "/create_assignment", :controller => "assignments", :action => "create"

  # READ
  get "/assignments", :controller => "assignments", :action => "index"
  get "/assignments/:id", :controller => "assignments", :action => "show"

  # UPDATE
  get "/assignments/:id/edit", :controller => "assignments", :action => "edit"
  post "/update_assignment/:id", :controller => "assignments", :action => "update"

  # DELETE
  get "/delete_assignment/:id", :controller => "assignments", :action => "destroy"
  #------------------------------

  # Routes for the Project resource:
  # CREATE
  get "/projects/new", :controller => "projects", :action => "new"
  post "/create_project", :controller => "projects", :action => "create"

  # READ
  get "/projects", :controller => "projects", :action => "index"
  get "/projects/:id", :controller => "projects", :action => "show"

  # UPDATE
  get "/projects/:id/edit", :controller => "projects", :action => "edit"
  post "/update_project/:id", :controller => "projects", :action => "update"

  # DELETE
  get "/delete_project/:id", :controller => "projects", :action => "destroy"
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  # READ
  get "/items", :controller => "items", :action => "index"
  get "/items/:id", :controller => "items", :action => "show"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

  # Routes for the Company resource:
  # CREATE
  get "/companies/new", :controller => "companies", :action => "new"
  post "/create_company", :controller => "companies", :action => "create"

  # READ
  get "/companies", :controller => "companies", :action => "index"
  get "/companies/:id", :controller => "companies", :action => "show"

  # UPDATE
  get "/companies/:id/edit", :controller => "companies", :action => "edit"
  post "/update_company/:id", :controller => "companies", :action => "update"

  # DELETE
  get "/delete_company/:id", :controller => "companies", :action => "destroy"
  #------------------------------

  devise_for :designers
  # Routes for the Designer resource:
  # READ
  get "/designers", :controller => "designers", :action => "index"
  get "/designers/:id", :controller => "designers", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
