Rails.application.routes.draw do
  post :shipping_tracks, to: 'shippings#track'
end
