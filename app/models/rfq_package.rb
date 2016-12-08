class RfqPackage
  enum :package_type,[:box,:crate,:Pallet,:drums,:bags,:sacks], default :box
  field :package_length , type: String
  field :package_breadth, type: String
  field :package_height , type: String
  field :package_volume , type: String
  field :package_weight , type: String
  enum :package_dimension_unit, [:cm, :inch], default :cm
  field :package_volume_unit, type: String
  field :package_weight_unit, type: String

end