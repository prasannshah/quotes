class QuoteRequest < ApplicationRecord
  #Field Definitions
  has_many :quote_responses
  enum transit_type: {air: 'air', ocean: 'ocean'}
end