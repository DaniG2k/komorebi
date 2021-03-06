Rails.application.routes.draw do
  get '' => redirect("/#{I18n.default_locale}")
  scope "/:locale", locale: /en|ja|ko/ do # Can also do: /#{I18n.available_locales.join("|")}/ do
    root 'rooms#index'
    devise_for :users
    resources :rooms
    get 'my_rooms', to: 'rooms#my_rooms'

    # mailbox folder routes
    %w(inbox sent trash).each do |mb|
      get "mailbox/#{mb}" => "mailbox#{mb}", as: "mailbox_#{mb}".to_sym
    end

    resources :conversations do
      member do
        %w(reply trash untrash).each {|convo| post convo.to_sym}          
      end
    end 
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
