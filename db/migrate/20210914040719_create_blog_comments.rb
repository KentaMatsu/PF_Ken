class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.integer :blog_id, null: false, default: ""
      t.integer :user_id, null: false, default: ""
      t.text :comment, null: false, default: ""
      t.float :evaluation, null: false, default: 0

      t.timestamps
    end
  end
end

