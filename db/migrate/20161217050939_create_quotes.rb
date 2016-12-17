class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.belongs_to :quote_response, index: true
      t.timestamps
    end
  end
end
