class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.date :start_datetime
      t.time :start_time
      t.time :end_time
      t.integer :will_travel_km
      t.integer :acceptance_deadline_hrs

      t.timestamps
    end
  end
end
