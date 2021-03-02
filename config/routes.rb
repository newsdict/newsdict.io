Rails.application.routes.draw do
  # For health-check
  get "active", to: proc { [200, Hash.new, Array.new] }
  # Admin routes
  devise_scope :user do
    scope module: :admin do
      scope module: :sources do
        resources :web_sites, path: "/admin/sources~web_site",only: [:edit, :update] do
          member do
            get :html
          end
        end
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
  resource :rss, path: "/rss/", controller: "portals/rss", action: :show, only: [:show] do
    collection do
      get "/category/:category/", as: :category
      get "/tag/:keyword/", as: :tag
    end
  end
  get "/sources/:id/", to: "portals/sources#show", as: :sources
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
  get "/pages/:url_suffix", to: "portals#page", as: :page
  authenticated :user do
    get "/category/:category", to: "portals/dashboards#show", as: :dashboards_category
    get "/tag/:tag", to: "portals/dashboards#show", as: :dashboards_tag
    get "/search/", to: "portals/dashboards#show", as: :dashboards_search
    root :to => "portals/dashboards#show", :as => "user_authenticated_root"
  end
  unauthenticated :user do
    resource :portals, path: "/category/:category/", controller: "portals", action: :show, only: [:show], as: :category
    resource :portals, path: "/tag/:tag/", controller: "portals", action: :show, only: [:show], as: :tag
    resource :portals, path: "/search/", controller: "portals", action: :show, only: [:show], as: :search
    root to: "portals#show"
  end
  get "/not_found", to: "errors#not_found", as: :not_found
  # In config.exception_app, zeitwerk gives a decreated error, so I get a 404 page here.
  get "*path", to: "application#exceptions_app"
end