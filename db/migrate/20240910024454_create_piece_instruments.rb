class CreatePieceInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :piece_instruments do |t|
      t.integer :piece_id,           null: false
      t.integer :instrument_id,      null: false
      t.integer :quantity,           null: false
      t.timestamps
    end
  end
end
