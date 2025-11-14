# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2025_02_14_150002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
  end

  create_table "images", force: :cascade do |t|
    t.string "main_image_url"
    t.integer "post_id"
    t.string "sub_image_url"
  end

  create_table "posts", force: :cascade do |t|
    t.string "subject_name"
    t.integer "term"
    t.integer "grade"
    t.string "memo"
    t.integer "course"
  end

end
