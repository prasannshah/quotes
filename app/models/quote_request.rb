class QuoteRequest < ApplicationRecord
  #Field Definitions
  enum transit_type: {air: 'air', ocean: 'ocean'}
end