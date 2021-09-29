class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.integer :blog_id, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false
      t.float :evaluation, null: false, default: 0

      t.timestamps
    end
  end
end

