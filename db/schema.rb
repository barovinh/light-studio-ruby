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

ActiveRecord::Schema[7.1].define(version: 0) do
  create_table "brand", primary_key: "brand_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "brand_img", null: false
    t.string "brand_name", null: false, collation: "utf8mb3_general_ci"
    t.text "brand_description", null: false, collation: "utf8mb3_general_ci"
  end

  create_table "cart", primary_key: "cart_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false, unsigned: true
    t.integer "phone_details_id", null: false
    t.integer "quantity"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["phone_details_id"], name: "FK_Cart_Phone_Details"
    t.index ["user_id"], name: "FK_Cart_Users"
  end

  create_table "image", primary_key: "image_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "phone_details_id", null: false
    t.string "file_path"
    t.index ["phone_details_id"], name: "FK_Image_Phone_Details"
  end

  create_table "import_receipts", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "provider_name"
    t.string "contact_name"
    t.string "phone_number"
    t.string "receipt_status"
    t.string "payment_status"
    t.bigint "user_id", unsigned: true
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["user_id"], name: "FK_Import_Receipts_Users"
  end

  create_table "import_receipts_details", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "import_receipt_id", unsigned: true
    t.integer "phone_details_id"
    t.integer "import_quantity"
    t.decimal "import_price", precision: 10
    t.string "unit_name"
    t.decimal "total_price", precision: 10
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["import_receipt_id"], name: "FK_Import_Receipts_Details_Import_Receipts"
    t.index ["phone_details_id"], name: "FK_Import_Receipts_Details_Phone_Details"
  end

  create_table "migrations", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "migration", null: false
    t.integer "batch", null: false
  end

  create_table "order", primary_key: "order_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", unsigned: true
    t.string "receiver_name"
    t.string "receiver_phone"
    t.integer "status_id"
    t.integer "payment_method_id"
    t.timestamp "order_date"
    t.timestamp "order_proceed_date"
    t.timestamp "order_delivering_date"
    t.timestamp "order_delivered_date"
    t.decimal "order_total_price", precision: 10
    t.string "order_address"
    t.index ["payment_method_id"], name: "FK_Order_Payment_Method"
    t.index ["status_id"], name: "FK_Order_Order_Status"
    t.index ["user_id"], name: "FK_Order_Users"
  end

  create_table "order_details", primary_key: "order_details_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "order_id"
    t.integer "phone_details_id"
    t.integer "order_quantity"
    t.decimal "total_price", precision: 10
    t.index ["order_id"], name: "FK_Order_Details_Order"
    t.index ["phone_details_id"], name: "FK_Order_Details_Phone_Details"
  end

  create_table "order_status", primary_key: "status_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "status_name"
  end

  create_table "payment_method", primary_key: "payment_method_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "payment_method_name"
  end

  create_table "phone_category", primary_key: "category_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "category_name", null: false, collation: "utf8mb3_general_ci"
    t.string "category_description", collation: "utf8mb3_general_ci"
    t.index ["category_name"], name: "category_name", unique: true
  end

  create_table "phone_colors", primary_key: "color_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "phone_id"
    t.string "color_name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "phone_details", primary_key: "phone_details_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "phone_id"
    t.integer "specific_id"
    t.integer "color_id"
    t.string "screen"
    t.string "ram"
    t.string "rom"
    t.string "cpu"
    t.string "front_cam"
    t.string "rear_cam"
    t.string "bluetooth_ver"
    t.string "wifi_ver"
    t.string "nfc"
    t.decimal "price", precision: 10
    t.decimal "discount", precision: 10
    t.integer "quantity"
    t.string "thumbnail_img"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["color_id"], name: "FK_Phone_Details_Phone_Colors"
    t.index ["phone_id"], name: "FK_Phone_Details_Phone"
    t.index ["specific_id"], name: "FK_Phone_Details_Phone_Specifics"
  end

  create_table "phone_os", primary_key: "os_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "os_name"
  end

  create_table "phone_specifics", primary_key: "specific_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "phone_id"
    t.string "specific_name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "phones", primary_key: "phone_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "brand_id"
    t.integer "category_id"
    t.integer "os_id"
    t.string "phone_name"
    t.text "description"
    t.string "youtube_url"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["category_id"], name: "FK_Phones_Phone_Category"
    t.index ["os_id"], name: "FK_Phones_Phone_Os"
  end

  create_table "posts", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "thumbnail"
    t.text "content"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.bigint "user_id", unsigned: true
    t.index ["user_id"], name: "FK_User_id"
  end

  create_table "review", primary_key: "review_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "phone_details_id", null: false
    t.bigint "user_id", null: false, unsigned: true
    t.text "content"
    t.integer "rating"
    t.timestamp "time"
    t.string "status"
    t.index ["phone_details_id"], name: "FK_Review_Phone_Details"
    t.index ["user_id"], name: "FK_Review_User"
  end

  create_table "sliders", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "slider_img_path"
  end

  create_table "tokens", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "token", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "user_roles", primary_key: "role_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "role_name"
  end

  create_table "users", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "gender"
    t.string "province_id", limit: 5
    t.string "district_id", limit: 5
    t.string "ward_id", limit: 5
    t.string "address"
    t.integer "user_point"
    t.integer "role_id"
    t.string "email", null: false
    t.timestamp "email_verified_at"
    t.string "password", null: false
    t.string "remember_token", limit: 100
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["email"], name: "users_email_unique", unique: true
    t.index ["phone_number"], name: "users_phone_number_unique", unique: true
  end

  add_foreign_key "import_receipts", "users", name: "FK_Import_Receipts_Users"
  add_foreign_key "import_receipts_details", "import_receipts", name: "FK_Import_Receipts_Details_Import_Receipts"
  add_foreign_key "import_receipts_details", "phone_details", column: "phone_details_id", primary_key: "phone_details_id", name: "FK_Import_Receipts_Details_Phone_Details"
  add_foreign_key "order", "order_status", column: "status_id", primary_key: "status_id", name: "FK_Order_Order_Status"
  add_foreign_key "order", "payment_method", primary_key: "payment_method_id", name: "FK_Order_Payment_Method"
  add_foreign_key "order", "users", name: "FK_Order_Users"
  add_foreign_key "order_details", "order", primary_key: "order_id", name: "FK_Order_Details_Order"
  add_foreign_key "order_details", "phone_details", column: "phone_details_id", primary_key: "phone_details_id", name: "FK_Order_Details_Phone_Details"
  add_foreign_key "phone_details", "phone_colors", column: "color_id", primary_key: "color_id", name: "FK_Phone_Details_Phone_Colors"
  add_foreign_key "phone_details", "phone_specifics", column: "specific_id", primary_key: "specific_id", name: "FK_Phone_Details_Phone_Specifics"
  add_foreign_key "phone_details", "phones", primary_key: "phone_id", name: "FK_Phone_Details_Phone"
  add_foreign_key "phones", "phone_category", column: "category_id", primary_key: "category_id", name: "FK_Phones_Phone_Category"
  add_foreign_key "phones", "phone_os", column: "os_id", primary_key: "os_id", name: "FK_Phones_Phone_Os"
  add_foreign_key "posts", "users", name: "FK_User_id"
  add_foreign_key "review", "phone_details", column: "phone_details_id", primary_key: "phone_details_id", name: "FK_Review_Phone_Details"
  add_foreign_key "review", "users", name: "FK_Review_User"
end
