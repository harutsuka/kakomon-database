class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :grade
      t.integer :course
      t.integer :term
      t.timestamps
    end
  end
end
