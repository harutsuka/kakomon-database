class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :post_id
      t.string :main_image_url
      t.string :sub_image_url

      t.timestamps
    end
  end
end
