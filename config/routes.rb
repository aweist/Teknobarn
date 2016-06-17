Rails.application.routes.draw do

  get "users/rsvp/:email" => "users#rsvp",
    :constraints => { :email => /.*/ }
  post 'users/rsvp' => 'users#rsvp_save'
  get 'users/send_invites' => 'users#send_invites'
  post 'users/send_invites' => 'users#send_invites'
  get 'about' => 'welcome#about'

  resources :users do
    member do
      get 'confirm'
      post 'confirm'
      get 'success'
      get 'decline'
    end
  end

  root 'welcome#index'
end
