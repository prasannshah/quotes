class Api::V1::QuoteRequestController < ApplicationController
  def authorize_win
    post_body = {
        "Username": 'systemuser@logistixian.com',
        "Password": 'win123456',
        "RememberMe": false
    }
    header = {"Content-Type": "application/json", "Accept":"application/json"}
    response = RestClient.post("http://integration.winwebconnect.com/api/v1/Login", post_body.to_json, header)
    render json:response.cookies
  end

  def fetch_schedules
    url = "http://integration.winwebconnect.com/api/v1/WASAPI"
    auth = "authToken="+params[:auth_token]
    p auth.to_s
    options = {:fromCode => "BOM", :toCode => "LHR", :fromType => "A", :toType => "A", :date => "2016-12-08", :maxConnections => 1, :daysOut=>0, :connectionType => "same", :excludeCodeShare => false, :includeFlight => true, :includeFreighter => true, :includeRFS=>false, :includeTrain =>false, :carriers => ""}
    response = RestClient.get(url, {params: options, :Authorization => auth, :content_type => :json, :accept => :json})
    return response
  end
end