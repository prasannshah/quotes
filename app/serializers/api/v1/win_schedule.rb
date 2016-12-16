class Api::V1::WinSchedule
  alias :read_attribute_for_serialization :send
  attr_accessor :id, :dep, :arr, :service_type, :flight_arr_day, :eff_dates, :arr_day, :carrier, :flight_no, :aircraft, :aircraft_change, :classes, :meal_codes, :code_share, :stops, :stop_codes, :elapsed_time, :distance, :days_of_op, :total_elapsed_time, :total_distance
  attr_accessor :id, :dep_port, :dep_country, :arr_port, :arr_country, :dep_date, :arr_date, :carrier, :days_of_ops
  def initialize(attributes)
    dep = attributes["Dep"]
    @dep_port = dep["City"]
    @dep_country = dep["Country"]["Code"]
    @dep_date = dep["DateTime"]
    arr = attributes["Arr"]
    @arr_port = arr["City"]
    @arr_country = arr["Country"]["Code"]
    @arr_date = arr["DateTime"]
    @carrier = attributes["Carrier"]["Code"]
    @days_of_ops = attributes["DaysOfOp"]
    # attributes.each do |key, value|
    #   instance_variable_set("@#{key.to_s.underscore}", value)
    # end
  end

  def self.model_name
    @_model_name ||= ActiveModel::Name.new(self)
  end

end