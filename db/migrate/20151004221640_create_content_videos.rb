class CreateContentVideos < ActiveRecord::Migration
  def change
    create_table :content_videos do |t|
      t.text :title
      t.text :description
      t.integer :author_id
      t.text :link
      t.text :state

      t.timestamps null: false
    end
  end
end
