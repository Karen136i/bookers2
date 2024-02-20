Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :update, :edit, :destroy]

   get "/homes/about" => "homes#about", as: "about"

end


# new(投稿を作成する画面)
# show(投稿の詳細画面)
# index(投稿の一覧画面)
# edit(投稿の編集画面)
# create(投稿作成)
# destroy(投稿削除)
# update(投稿更新)