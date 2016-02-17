class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_body
      t.boolean :anonymous_comment
      t.references :User, index: true, foreign_key: true
      t.references :Post, index: true, foreign_key: true

      t.timestamps null: false
    end
	add_index :comments, [:post_id, :created_at]
  end
end
