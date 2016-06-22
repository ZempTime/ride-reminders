Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "accounts/sessions", registrations: "accounts/registrations", passwords: "accounts/passwords" }

  resources :alarms

  root to: "alarms#ndex"
end
