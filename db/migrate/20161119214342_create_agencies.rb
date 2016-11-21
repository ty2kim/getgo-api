class CreateAgencies < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies, id: false do |t|
      t.string :id, null: false
      t.string :name
      t.string :url
      t.string :timezone
      t.string :lang
      t.string :phone
      t.string :fare_url
    end
    execute 'ALTER TABLE agencies ADD PRIMARY KEY (id);'
  end
end
