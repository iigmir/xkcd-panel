Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "app#index"
  scope :path => "/api/v1/", :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    get "/test", to: "test#index"
    get "/event", to: "events#index"
    get "/event/:id", to: "events#show"
  end
end
