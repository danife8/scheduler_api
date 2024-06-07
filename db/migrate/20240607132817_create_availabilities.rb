class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.datetime :date
      t.time :start_time
      t.time :end_time
      t.references :specialist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
