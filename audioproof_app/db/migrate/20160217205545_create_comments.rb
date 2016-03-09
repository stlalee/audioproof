class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_body
      t.boolean :anonymous_comment
      t.references :user, index: true, foreign_key: 'user_id'
      t.references :post, index: true, foreign_key: 'post_id'
      t.timestamps null: false
    end
	add_index :comments, [:post_id, :created_at]
  end
end
