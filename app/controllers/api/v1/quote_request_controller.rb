class Api::V1::QuoteRequestController < ApplicationController

  def fetch_air_schedules
    schedules = WinSchedule.fetch_schedules
    render json: schedules
  end

end