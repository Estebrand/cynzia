Rails.application.routes.draw do

  get 'cart/add_to_cart'

  get 'cart/view_order'

  get 'cart/checkout'

  get 'portfolio/portrait_people'

  get 'portfolio/portrait_pets'

  get 'portfolio/fine_art'

  get 'storefront/all_items'

  get 'storefront/items_by_category'

  get 'storefront/items_by_brand'


  root 'storefront#feature'

  get 'store'=> 'storefront#all_items'

  get 'categorical' => 'storefront#items_by_category'

  get 'branding' => 'storefront#items_by_brand'

  get 'login' => 'users#edit'

  devise_for :users
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
