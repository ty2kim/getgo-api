class CreateStopTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :stop_times do |t|
      t.string :trip_id
      t.string :arrival_time
      t.string :departure_time
      t.string :stop_id
      t.integer :stop_sequence
      t.integer :pickup_type
      t.integer :drop_off_type
    end
    execute 'ALTER TABLE stop_times ADD FOREIGN KEY (trip_id) REFERENCES trips (id) MATCH FULL;'
    execute 'ALTER TABLE stop_times ADD FOREIGN KEY (stop_id) REFERENCES stops (id) MATCH FULL;'
  end
end
