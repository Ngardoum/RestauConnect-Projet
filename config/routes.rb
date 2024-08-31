Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/create'
  get 'orders/edit'
  get 'orders/update'
  get 'orders/destroy'
  root to: 'pages#home'  # Définit la page d'accueil

  # Routes pour devise (gestion des utilisateurs)
  devise_for :users

  # Routes pour les utilisateurs (restreint à show, edit, update)
  resources :users, only: [:show, :edit, :update] do
    get 'dashboard', on: :member  # Route personnalisée pour le tableau de bord d'un utilisateur spécifique
  end

  # Routes pour les pages statiques
  get 'pages/home'

  # Routes pour les menus (incluse dans les resources restaurants)
  resources :menus, only: [:index, :new, :create, :edit, :update, :destroy]

  # Routes pour les restaurants avec des menus imbriqués
  resources :restaurants do
    resources :menus, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end

