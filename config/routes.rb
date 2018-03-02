Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      get '/transactions' => 'process_files#transactions'
      get '/process_cnab' => 'process_files#process_cnab'
    end
  end
end
