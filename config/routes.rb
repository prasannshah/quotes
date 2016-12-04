require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resource :quote_request
      get 'quote_request/authorize_win', to: 'quote_request#authorize_win'
      post 'quote_request/fetch_schedules', to: 'quote_request#fetch_schedules'
    end
  end

end
