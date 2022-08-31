Rails.application.routes.draw do
  resources :users, only:[]
  resources :sales, only:[]
  resources :products, only:[]
  
  post "/upload_sales", to: "attachments#upload_sales"
end
