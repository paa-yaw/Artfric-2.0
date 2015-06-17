class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :artwork, index: true
      t.references :artist, index: true

      t.timestamps
    end
  end
end
