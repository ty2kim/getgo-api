class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes, id: false do |t|
      t.string :id, null: false
      t.string :agency_id
      t.string :short_name
      t.string :long_name
      t.integer :route_type
      t.string :color
      t.string :text_color
    end
    execute 'ALTER TABLE routes ADD PRIMARY KEY (id);'
    execute 'ALTER TABLE routes ADD FOREIGN KEY (agency_id) REFERENCES agencies (id) MATCH FULL;'
  end
end
