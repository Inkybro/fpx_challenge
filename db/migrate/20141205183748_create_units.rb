class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :vin
      t.integer :year
      t.string :make
      t.string :model
      t.references :dealer

      t.timestamps
    end
  end
end
