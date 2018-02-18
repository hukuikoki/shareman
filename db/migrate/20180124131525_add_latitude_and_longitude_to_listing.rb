class AddLatitudeAndLongitudeToListing < ActiveRecord::Migration[4.2][5.1]
  def change
    add_column :listings, :latitude, :float
    add_column :listings, :longitude, :float
  end
end
