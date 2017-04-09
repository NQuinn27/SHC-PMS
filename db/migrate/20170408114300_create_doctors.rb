class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.text :qualifications
      t.string :hospital
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
