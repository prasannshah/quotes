class Api::V1::QuoteRequestController < ApplicationController

  def create_quote_request
    p params[:port_of_loading]
    quote_request = QuoteRequest.create()
    quote_request.port_of_loading = {:code => params[:port_of_loading][:code], :name => params[:port_of_loading[:name]]}
    quote_request.port_of_discharge = {:code => params[:port_of_discharge][:code], :name => params[:port_of_discharge[:name]]}
    quote_request.shipment_date = "2016-12-12"
    quote_request.save!
    render json: {request_id: quote_request.id}
  end

  def fetch_air_schedules
    quote_request = QuoteRequest.find(params[:quote_id])
    options = {:fromCode => quote_request.port_of_loading[:code], :toCode => quote_request.port_of_discharge[:code], :date => "2016-12-12" }
    schedules = WinSchedule.fetch_schedules(options)
    render json: schedules
  end

end