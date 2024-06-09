class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.time :time
      t.references :patient, null: false, foreign_key: true
      t.references :specialist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
