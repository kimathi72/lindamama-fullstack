class CreateDietBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :diet_blogs do |t|
      t.string :title
      t.string :image
      t.string :content

      t.timestamps
    end
  end
end
