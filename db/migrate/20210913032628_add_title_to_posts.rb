class AddTitleToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string, null: false, default: ""
    add_column :posts, :text, :text, null: false, default: ""
  end
end
