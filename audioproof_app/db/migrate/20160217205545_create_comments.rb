class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_body
      t.references :User, index: true, foreign_key: true
      t.references :Post, index: true, foreign_key: true

      t.timestamps null: false
    end
	add_index :comments, [:user_id, :created_at]
  end
end
