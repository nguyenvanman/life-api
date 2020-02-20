Rails.application.routes.draw do
  
  scope :api do
    scope :auth do 
      post 'sign_in', to: 'auth#sign_in'
    end 
  end

end
