class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.references :route, foreign_key: true
      t.string :service_id
      t.string :trip_id
      t.string :headsign
      t.string :short_name
      t.string :direction_id
      t.string :block_id
      t.string :shape_id
      t.string :wheelchair_accessible
      t.string :bikes_allowed
      t.string :route_variant

      t.timestamps
    end
  end
end
