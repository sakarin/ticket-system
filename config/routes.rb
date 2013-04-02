TicketSystem::Application.routes.draw do
  get "booking_step/select_seat"

  get "booking_step/comfirm"

  get "booking_step/summary"

  resources :destinations


  resources :sources


  resources :trips


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

  resources :bookings do
    collection do
      match 'search' => 'bookings#search', :via => [:get, :post], :as => :search

    end
  end

  resources :booking_steps

end