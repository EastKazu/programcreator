class CreateComposers < ActiveRecord::Migration[7.0]
  def change
    create_table :composers do |t|

      t.timestamps
    end
  end
end
