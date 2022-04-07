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

ActiveRecord::Schema.define(version: 2022_04_02_034348) do

  create_table "active_admin_comments", charset: "utf8mb3", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "likes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "rname"
    t.text "rinformation"
    t.string "rimage"
    t.text "ingredient"
    t.text "procedure_1"
    t.text "procedure_2"
    t.text "procedure_3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "Energy", precision: 7, scale: 2
    t.decimal "Protein", precision: 7, scale: 2
    t.decimal "Lipid", precision: 7, scale: 2
    t.decimal "Carbohydrate", precision: 7, scale: 2
    t.decimal "Dietary_fiber", precision: 7, scale: 2
    t.decimal "Potassium", precision: 7, scale: 2
    t.decimal "Calcium", precision: 7, scale: 2
    t.decimal "iron", precision: 7, scale: 2
    t.decimal "Zinc", precision: 7, scale: 2
    t.decimal "VitaminA", precision: 7, scale: 2
    t.decimal "VitaminB1", precision: 7, scale: 2
    t.decimal "VitaminB2", precision: 7, scale: 2
    t.decimal "VitaminC", precision: 7, scale: 2
    t.decimal "Salt_equivalent", precision: 7, scale: 2
    t.decimal "quantity", precision: 7, scale: 2, default: "1.0"
    t.index ["user_id"], name: "fk_rails_5b5ddfd518"
  end

  create_table "standards", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "Category"
    t.decimal "xEnergy", precision: 7, scale: 2
    t.decimal "xProtein", precision: 7, scale: 2
    t.decimal "xLipid", precision: 7, scale: 2
    t.decimal "xCarbohydrate", precision: 7, scale: 2
    t.decimal "xDietary_fiber", precision: 7, scale: 2
    t.decimal "xPotassium", precision: 7, scale: 2
    t.decimal "xCalcium", precision: 7, scale: 2
    t.decimal "xiron", precision: 7, scale: 2
    t.decimal "xZinc", precision: 7, scale: 2
    t.decimal "xVitaminA", precision: 7, scale: 2
    t.decimal "xVitaminB1", precision: 7, scale: 2
    t.decimal "xVitaminB2", precision: 7, scale: 2
    t.decimal "xVitaminC", precision: 7, scale: 2
    t.decimal "xSalt_equivalent", precision: 7, scale: 2
    t.integer "min_age"
    t.integer "max_age"
    t.integer "sex"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.integer "sex", default: 0, null: false
    t.string "image"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
end
