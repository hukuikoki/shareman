class AddPetTypeToListings < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :listings, :pet_type, :string
  end
end
