class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips, id: false do |t|
      t.string :id, null: false
      t.string :route_id
      t.string :service_id
      t.string :headsign
      t.string :short_name
      t.string :direction_id
      t.string :block_id
      t.string :shape_id
      t.integer :wheelchair_accessible
      t.integer :bikes_allowed
      t.string :route_variant
    end
    execute 'ALTER TABLE trips ADD PRIMARY KEY (id);'
    execute 'ALTER TABLE trips ADD FOREIGN KEY (route_id) REFERENCES routes (id) MATCH FULL;'
  end
end
