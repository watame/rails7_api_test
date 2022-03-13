# RSpec実行時に`uninitialized constant Rack::Cora`エラーが出るため、明示的にrequireを行う
# https://github-com.translate.goog/cyu/rack-cors/issues/26?_x_tr_sl=auto&_x_tr_tl=ja&_x_tr_hl=ja&_x_tr_pto=op,wapp#issuecomment-100170167
require 'rack'
require 'rack/cors'
# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development?
      # swagger-ui コンテナからの通信を許可
      origins "localhost:8080"
      resource "*",
               headers: :any,
               methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
    if Rails.env.test?
      origins '*'
      resource '*',
               headers: :any,
               methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
end
