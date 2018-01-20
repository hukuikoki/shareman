class AddExtraFieldsToUser < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :description, :string
  end
end
