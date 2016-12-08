class QuoteRequest
  field :requester_name, type: String
  enum :incoterms, [:EXW, :FCA, :CPT, :CIP, :DAT, :DAP, :DDP, :FAS, :FOB, :CFR, :CIF], default: nil
  enum :service_type, [:DD, :DP, :PD, :PP], default: nil
  field :from_address, type: String
  field :to_address, type: String
  has_many :rfq_packages
  field :is_hazardous, type: bool
  field :include_insurance, type: bool
  field :is_temperature_controlled, type:bool
  # TODO: Other services yet to be added
  field :clearance_date, type: Date
end