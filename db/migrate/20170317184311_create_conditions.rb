class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.text :description
      t.string :code

      t.timestamps
    end
  end
end
