Rails.application.routes.draw do
  
  scope :api do
    scope :auth do 
      post 'sign_in', to: 'auth#sign_in'
      post 'sign_up', to: 'auth#sign_up'
    end 

    scope :users do
      scope :me do
        put '', to: 'users#update'
        post 'transaction_item', to: 'transaction_items#create'
      end
    end
  end

end
