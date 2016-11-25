class CreateCalendarDates < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_dates do |t|
      t.string :service_id
      # str = Time.now.strftime("%Y%m%d") => date -> string
      # date = Date.parse str => string -> date
      t.string :date
      t.string :exception_type
    end
  end
end
