class CreateSpecialists < ActiveRecord::Migration[7.1]
  def change
    create_table :specialists do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :specialty

      t.timestamps
    end
  end
end
