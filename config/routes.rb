Rails.application.routes.draw do
  # For health-check
  get "active", to: proc { [200, Hash.new, Array.new] }
  # Admin routes
  scope module: :sources do
    resources :web_sites, path: "/admin/sources~web_site",only: [:edit, :update] do
      member do
        get :html
      end
    end
  end
  mount Sidekiq::Web => "/sidekiq", constraints: SuperAdminConstraint.new, as: "sidekiq_web"
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for "user", :controllers => {
    registrations: 'admin/registrations',
    omniauth_callbacks: 'admin/omniauth_callbacks'
  }
  # Feed routes
  resource :rss, path: "/rss/", controller: "timelines/rss", action: :show, only: [:show] do
    collection do
      get "/category/:category/", as: :category
      get "/tag/:keyword/", as: :tag
    end
  end
  resource :timelines, path: "/category/:category/", controller: "timelines", action: :show, only: [:show], as: :category
  resource :timelines, path: "/tag/:tag/", controller: "timelines", action: :show, only: [:show], as: :tag
  resource :timelines, path: "/search/", controller: "timelines", action: :show, only: [:show], as: :search
  resources :contents, only: :show
  get "/paper/term/:from_date/:to_date/", to: "papers#term", as: :paper_term
  get "/paper/term/:date/", to: "papers#one_day", as: :paper_oneday
  get "/paper/:id/", to: "papers#show", as: :paper
  resource :inquiries, only: [:show, :create] do
    collection do
      post :request_removing
    end
  end
  get "/img/:id", to: "images#index", as: :img
  get "/user_icon/:id", to: "images#user_icon", as: :user_icon
  # Apis
  namespace :api do
    namespace :v1 do
      resource :contents, only: [:show]
    end
  end
  authenticated :user do
    get "/search/", to: "dashboards#search", as: :dashboards_search
    get "/tag/", to: "dashboards#tag", as: :dashboards_tag
    root :to => "dashboards#show", :as => "user_authenticated_root"
  end
  root to: "timelines#show"
end