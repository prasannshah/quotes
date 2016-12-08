require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resource :quote_request
      post 'quote_request/fetch_air_schedules', to: 'quote_request#fetch_air_schedules'
    end
  end

end
