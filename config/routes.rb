Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #ゲストユーザー用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


 root to: 'homes#top'



  namespace :admin do
    resources :foods, only: [:index, :show, :create] do
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update]
  end



  scope module: "public" do
    get  "/users/sign_out" => "sessions#destroy" #ログアウト
    get "/users/my_page" => "users#show" #ユーザー情報詳細ページ（マイページ）表示
    get "/users/unsubscribe" => "users#unsubscribe" #退会確認画面の表示
    patch "/users/withdraw" => "users#withdraw" #退会フラグを切り替える

    resources :foods, only: [:index, :show, :create] do
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:edit, :update]
  end






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
