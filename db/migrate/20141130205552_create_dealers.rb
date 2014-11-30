class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name, null: false
      t.string :address
      t.string :city, limit: 100, null: false
      t.string :state, limit: 2, null: false
      t.string :zip, limit: 9, null: false
    end

    add_index :dealers, :name, length: 10
  end
end
