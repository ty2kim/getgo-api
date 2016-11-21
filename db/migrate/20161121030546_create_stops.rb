class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops, id: false do |t|
      t.string :id, null: false
      t.string :name
      t.string :lat
      t.string :lon
      t.string :zone_id
      t.string :url
      t.integer :location_type
      t.string :parent_station
      t.integer :wheelchair_boarding
    end
    execute 'ALTER TABLE stops ADD PRIMARY KEY (id);'
  end
end
