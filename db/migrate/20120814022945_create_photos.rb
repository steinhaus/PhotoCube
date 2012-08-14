class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.date :expires
      t.boolean :active

      t.timestamps
    end
  end
end
