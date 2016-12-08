class QuoteRequest < ApplicationRecord
  #Field Definitions
  enum service_type: [:PP, :PD, :DP, :DD]
end
