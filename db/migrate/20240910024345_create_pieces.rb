class CreatePieces < ActiveRecord::Migration[7.0]
  def change
    create_table :pieces do |t|
      t.text :piece_name,           null: false
      t.integer :composer_id,       null: false
      t.integer :duration,          null: false
      t.integer :genre_id,          null: false
      t.integer :year_composed,     null: false
      t.integer :country_id,        null: false
      t.text    :remarks
      t.integer :timestamps,        null: false
    end
  end
end
