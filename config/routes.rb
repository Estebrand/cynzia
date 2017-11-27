Rails.application.routes.draw do

 # CART
  post 'add_to_cart'=> 'cart#add_to_cart'

  get 'view_order' => 'cart#view_order'

  get 'checkout' => 'cart#checkout'

  get 'edit_item' => 'cart#edit_line_item'

  post 'order_complete' => 'cart#order_complete'

  get 'edit_line_item' => 'cart#edit_line_item'

  post 'edit_line_item' => 'cart#edit_line_item'

  post 'delete_line_item' => 'cart#delete_line_item'
  
  get 'delete_line_item' => 'cart#delete_line_item'

# MAIN NAVIGATIONS 
  root 'storefront#feature'

  get 'store'=> 'storefront#all_items'

  get 'categorical' => 'storefront#items_by_category'

  get 'branding' => 'storefront#items_by_brand'

  # get 'login' => 'users#edit'

  devise_for :users
  resources :products


  
  get 'portfolio/portrait_people'

  get 'portfolio/portrait_pets'

  get 'portfolio/fine_art'

  get 'storefront/all_items'

  get 'storefront/items_by_category'

  get 'storefront/items_by_brand'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
