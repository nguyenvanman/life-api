Rails.application.routes.draw do
  
  scope :api do
    scope :auth do 
      post 'sign_in', to: 'auth#sign_in'
      post 'sign_up', to: 'auth#sign_up'
    end 

    scope :users do
      scope :me do
        get '', to: 'users#show'
        put '', to: 'users#update'
        resources :transaction_items, only: %i[create index] 
        resources :categories, only: %i[index] do
          get 'transactions', to:'transaction_items#get_by_category'
        end
      end
    end
  end

end
