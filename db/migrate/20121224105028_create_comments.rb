class CreateComments < ActiveRecord::Migration
  def change
  	#drop_table :comments

    create_table :comments do |t|
      t.integer :user_id
      t.string :body
      t.references :post

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
