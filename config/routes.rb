TicketSystem::Application.routes.draw do

  get "dashboard/index"

  #get "bookings/index"

  get "booking_step/select_seat"

  get "booking_step/comfirm"

  get "booking_step/summary"

  #match 'admin/purchase_orders/download', :to => "admin/purchase_orders#download"
  match 'report/bookings/:id/report', :to => "report/bookings#report"

  resources :destinations


  resources :sources


  resources :trips


  authenticated :user do
    root :to => 'dashboard#index'
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

  namespace :report do
    resources :bookings do
      #collection do
      #  match 'report' => 'bookings#report', :via => [:get], :as => :report
      #end
    end
  end

end