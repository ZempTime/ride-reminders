Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "accounts/sessions", registrations: "accounts/registrations", passwords: "accounts/passwords" }

  resources :reminders
  resources :ride_schedules

  root to: "reminders#index"
end
