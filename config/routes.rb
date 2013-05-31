TicketSystem::Application.routes.draw do


  mount RedactorRails::Engine => '/redactor_rails'

  get "dashboard/index"

  #get "bookings/index"

  get "booking_step/select_seat"

  get "booking_step/comfirm"

  get "booking_step/summary"

  #match 'admin/purchase_orders/download', :to => "admin/purchase_orders#download"
  match 'report/bookings/:id/report', :to => "report/bookings#report"
  match 'report/companies/search', :to => "report/companies#search"

  resources :destinations

  resources :routes do
    collection do
      match 'prototype' => 'routes#prototype', :via => [:get, :post], :as => :prototype
      match 'clone' => 'routes#clone', :via => [:get, :post], :as => :clone

    end
  end

  resources :companies
  resources :prototypes

  authenticated :user do
    root :to => 'dashboard#index'
  end
  root :to => "home#index"


  devise_for :users
  resources :users do
    collection do
      get :invite
    end
  end

  resources :bookings do
    collection do
      match 'search' => 'bookings#search', :via => [:get, :post], :as => :search

    end
  end

  namespace :agent do
    resources :users
  end


  resources :booking_steps

  namespace :report do
    resources :bookings do

    end
    resources :companies

  end

end