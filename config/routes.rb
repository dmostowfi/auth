Rails.application.routes.draw do
  resources "companies"
  resources "contacts"
  resources "activities"
  resources "tasks"
  resources "users"
  resources "sessions"
  get "/logout", :controller => "sessions", :action => "destroy" #points to destroy action in sessions controller
  get "/login", :controller => "sessions", :action => "new" #points to new action in sessions controller
  #these gets are setting up custom URLs. they're more user friendly instead of asking users to go to /sessions/new
end
