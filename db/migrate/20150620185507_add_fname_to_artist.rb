class AddFnameToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :fname, :string
  end
end
