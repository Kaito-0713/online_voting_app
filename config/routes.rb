Rails.application.routes.draw do 
  get 'contacts/new'
  get 'users/show'
  root "home#index"

  # お問い合わせページ
  get "contact", to: "home#contact", as: "contact"

  # 管理者用ネームスペース
  namespace :admin do
    resources :elections do
      member do
        get :results
      end
      resources :candidates do
        member do
          delete :remove_image
        end
      end
    end
  end

  # 一般ユーザー用
  resources :elections, only: [:index, :show] do
    resources :candidates, only: [:index, :show] do
      collection do
        get :search
      end
    end
    resources :votes, only: [:new, :create, :show]
  end

  # config/routes.rb
devise_for :users, controllers: {
  registrations: 'users/registrations'
}

  # ActiveStorageのルートをマウント
  direct :rails_blob do |blob, options|
    route_for(:rails_service_blob, blob.signed_id, blob.filename, options)
  end
end
