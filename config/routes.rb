Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/users', to: 'users#index'
  get "/homes/about" => "homes#about", as: "about"

  resources :books, only: [:create, :index, :show, :update, :edit, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  

end


# new(投稿を作成する画面)
# show(投稿の詳細画面)
# index(投稿の一覧画面)
# edit(投稿の編集画面)
# create(投稿作成)
# destroy(投稿削除)
# update(投稿更新)