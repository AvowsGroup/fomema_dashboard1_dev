Rails.application.routes.draw do
  get 'first_dashboard/index'
  root 'home#index'
  resources :first_dashboard ,only: [:index] do 
    collection do
      match 'excel_generate', to: 'first_dashboard#excel_generate', via: [:get, :post], defaults: { format: :xlsx }

      # post '/excel_generate',to: "first_dashboard#excel_generate" , defaults: { format: :xlsx } 
    end 
  end
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end