class AddItemsToDoctor < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :phone_office, :string
    add_column :doctors, :phone_mobile, :string
    add_column :doctors, :date_of_birth, :date
  end
end
