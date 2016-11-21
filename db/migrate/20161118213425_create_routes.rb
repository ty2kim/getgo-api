class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :route_id
      t.references :agency, foreign_key: true
      t.string :short_name
      t.string :long_name
      t.string :route_type
      t.string :color
      t.string :text_color

      t.timestamps
    end
  end
end
