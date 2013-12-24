class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email
      t.string :name
      t.string :content
      t.boolean :premoderation,	 :default => false
      t.integer :book_id

      t.timestamps
    end
  end
end
