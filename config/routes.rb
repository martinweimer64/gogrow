Rails.application.routes.draw do
  resources :users, only:[ :show] do
    get "/show_sales", to: "users#show_sales_by_user"
    get "/show_buys", to: "users#show_buys_by_user"
  end
  
  resources :sales, only:[ :index, :show]
  resources :products, only:[:index]
  
  post "/upload_sales", to: "attachments#upload_sales"
end
