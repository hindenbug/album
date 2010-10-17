class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.integer :album_id
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
