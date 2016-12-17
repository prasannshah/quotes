class CreateQuoteResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :quote_responses do |t|
      t.belongs_to :quote_request, index: true
      t.string :connection_id
      t.timestamps
    end
  end
end
