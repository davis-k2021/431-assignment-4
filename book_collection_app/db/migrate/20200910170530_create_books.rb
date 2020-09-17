class CreateBooks < ActiveRecord::Migration[6.0]
  def up
    create_table :books do |t|
      t.string "title", :limit => 200, :null => false
      t.string "author", :limit => 75, :null => false
      t.string "genre", :limit => 25, :null => false
      t.decimal "price", :precision => 11, :scale => 2, :null => false
      t.date "published_date", :null => false
      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
