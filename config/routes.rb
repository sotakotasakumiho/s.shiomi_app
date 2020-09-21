Rails.application.routes.draw do
  devise_for :users  #deviseで作成されたユーザー認証用のルーティング

  root to: 'posts#index'  #ホーム画面は投稿一覧画面に設定

  resources :posts do  #postsコントローラへのルーティング  
    resources :comments, only: [:create]  #commentsコントローラへのルーティング
  end
end
