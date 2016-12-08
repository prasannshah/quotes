class CreateQuoteRequests < ActiveRecord::Migration[5.0]
  def change
    enable_extension :hstore
    create_table :quote_requests do |t|
      t.hstore :port_of_loading
      t.hstore :port_of_discharge
      t.string :incoterms
      t.string :to_address
      t.string :from_address
      t.string :service_type
      t.json :packages
      t.decimal :shipment_valuation
      t.boolean :hazardous?
      t.boolean :insurance?
      t.boolean :temp_controlled?
      t.string :other_services, array: true
      t.datetime :shipment_date
      t.timestamps
    end
  end
end
