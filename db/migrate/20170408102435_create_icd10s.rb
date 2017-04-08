class CreateIcd10s < ActiveRecord::Migration[5.1]
  def change
    create_table :icd10s do |t|
      t.string :code
      t.text :description
      t.text :additional

      t.timestamps
    end
    add_index :icd10s, :code, unique: true
  end
end
