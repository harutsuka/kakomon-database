class AddSubjectNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :subject_name, :string
  end
end
