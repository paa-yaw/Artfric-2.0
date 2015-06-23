class AddProfilePicToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :profile_pic, :string
  end
end
