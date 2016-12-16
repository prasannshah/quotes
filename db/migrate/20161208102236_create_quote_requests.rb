class CreateQuoteRequests < ActiveRecord::Migration[5.0]
  def change
    enable_extension :hstore
    create_table :quote_requests do |t|
      t.string :transit_type
      t.string :requester
      t.string :commodity
      t.hstore :port_of_loading
      t.hstore :port_of_discharge
      t.string :to_address
      t.string :from_address
      t.json :air_packages # package = [{l,b,h,w,vw},...]
      t.decimal :shipment_valuation
      t.boolean :hazardous
      t.boolean :insurance
      t.boolean :temp_controlled
      t.integer :min_temperature
      t.integer :max_temperature
      t.hstore :other_services_charges
      t.datetime :shipment_ready_date
      t.datetime :shipment_clearance_date
      t.string :carrier_preference
      t.timestamps
    end
  end
end
