class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :sender_id
      t.integer :receiver_id

      t.references :venue, null: false, foreign_key: true
      t.datetime :start_datetime
      t.text :content, default: ""
      t.integer :acceptance_deadline_hrs
      t.boolean :is_accepted, default: false
      t.boolean :is_complete, default: false
      t.boolean :sender_won

      t.timestamps
    end
  end
end
