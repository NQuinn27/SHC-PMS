class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.text :address
      t.bigint :phone_number
      t.text :allergies
      t.text :notes

      t.timestamps
    end
  end
end
