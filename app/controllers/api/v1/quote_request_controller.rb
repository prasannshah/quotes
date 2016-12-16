require 'json'
class Api::V1::QuoteRequestController < ApplicationController

  def create_quote_request
    quote_request = QuoteRequest.create()
    quote_request.transit_type = params[:transitType]
    quote_request.requester = params[:client]
    quote_request.port_of_loading = {:code => params[:fromCode], :name => "abc"}
    quote_request.port_of_discharge = {:code => params[:toCode], :name => "def"}
    quote_request.shipment_ready_date = Date.strptime(params[:startDate], '%m/%d/%Y')
    quote_request.temp_controlled = params[:tempControlled]
    quote_request.hazardous = params[:hazardous]
    quote_request.air_packages = params[:airPackages]
    quote_request.commodity = params[:product]
    quote_request.save!
    render json: {quote_request_id: quote_request.id}
  end

  def fetch_air_schedules
    quote_request = QuoteRequest.find(params[:quote_request_id])
    options = {:fromCode => quote_request.port_of_loading["code"], :toCode => quote_request.port_of_discharge["code"], :date => quote_request.shipment_ready_date.strftime('%F')}
    schedules_json = WinService.fetch_schedules(options)
    win_schedules = JSON.parse(schedules_json)
    render json: win_schedules.map {|schedule| Api::V1::WinSchedule.new(schedule)}
  end

  def supported_carriers
    air_carriers = Hash.new

  end

end