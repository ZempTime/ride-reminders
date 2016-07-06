Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "accounts/sessions", registrations: "accounts/registrations", passwords: "accounts/passwords" }

  resources :alarms do
    resources :reminders
  end

  resources :ride_schedules

  root to: "ride_schedules#index"
end
