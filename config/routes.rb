Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "accounts/sessions", registrations: "accounts/registrations", passwords: "accounts/passwords" }

  # For push notifications in browsers:
  config.serviceworker.routes do
    match "serviceworker.js"
  end

  resources :alarms do
    resources :reminders
  end

  resources :ride_schedules

  root to: "ride_schedules#index"
end
