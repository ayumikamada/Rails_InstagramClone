
ActiveRecord::Schema.define(version: 2020_09_05_033317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.text "introduce"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "pictures", "users"
end
