Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'cervejeira#index'

  scope :cervejeira do
    post "/get_cerveja", to: 'cervejeira#get_cerveja'
    get "/cerveja", to: "cervejeira#cerveja"
  end

end
