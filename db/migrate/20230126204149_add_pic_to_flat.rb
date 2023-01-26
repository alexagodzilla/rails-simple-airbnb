class AddPicToFlat < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :pic, :string
  end
end
