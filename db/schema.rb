# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111221050201) do

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "secret"
    t.string   "token"
    t.integer  "user_id"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured"
    t.integer  "order",      :default => 0
  end

  add_index "categories", ["featured"], :name => "index_categories_on_featured"
  add_index "categories", ["order"], :name => "index_categories_on_order"

  create_table "i_calendars", :force => true do |t|
    t.text     "schedule_yaml", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "attachment"
    t.integer  "package_id"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",      :null => false
    t.boolean  "featured"
    t.string   "name",       :null => false
    t.string   "zipcode",    :null => false
  end

  create_table "packages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id",     :null => false
    t.date     "delivery_date",   :null => false
    t.integer  "frequency",       :null => false
    t.integer  "price",           :null => false
    t.string   "name",            :null => false
    t.integer  "subscription_id"
  end

  add_index "packages", ["category_id"], :name => "index_packages_on_category_id"
  add_index "packages", ["subscription_id"], :name => "index_packages_on_subscription_id"

  create_table "purchases", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "purchase_date", :null => false
    t.integer  "package_id",    :null => false
    t.integer  "price",         :null => false
    t.integer  "user_id",       :null => false
    t.string   "card_type"
    t.string   "card_number"
    t.integer  "billing_id"
    t.integer  "serving_id"
  end

  add_index "purchases", ["package_id"], :name => "index_purchases_on_package_id"
  add_index "purchases", ["user_id"], :name => "index_purchases_on_user_id"

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
    t.string   "image_ext"
  end

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_f9716c4215584edbca2557e32706a5ae084a15ef"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale"
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_d079468f88bff1c6ea81573a0d019ba8bf5c2902"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_uid"
    t.string   "file_ext"
  end

  create_table "refinery_roles", :force => true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], :name => "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], :name => "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scoping"
    t.boolean  "restricted",              :default => false
    t.string   "callback_proc_as_string"
    t.string   "form_value_type"
  end

  add_index "refinery_settings", ["name"], :name => "index_refinery_settings_on_name"

  create_table "refinery_user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], :name => "index_refinery_user_plugins_on_title"
  add_index "refinery_user_plugins", ["user_id", "name"], :name => "index_unique_refinery_user_plugins", :unique => true

  create_table "refinery_users", :force => true do |t|
    t.string   "username",             :null => false
    t.string   "email",                :null => false
    t.string   "encrypted_password",   :null => false
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
  end

  add_index "refinery_users", ["id"], :name => "index_refinery_users_on_id"

  create_table "schedules", :force => true do |t|
    t.float    "radium"
    t.text     "schedule_yaml"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "package_id"
  end

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "index_seo_meta_on_seo_meta_id_and_seo_meta_type"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
    t.string   "locale"
  end

  add_index "slugs", ["locale"], :name => "index_slugs_on_locale"
  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "subscriptions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "area",                       :null => false
    t.boolean  "featured"
    t.integer  "merchant_id",                :null => false
    t.string   "name",                       :null => false
    t.integer  "order",       :default => 0
    t.string   "zipcode",                    :null => false
  end

  add_index "subscriptions", ["featured"], :name => "index_subscriptions_on_featured"
  add_index "subscriptions", ["merchant_id"], :name => "index_subscriptions_on_merchant_id"
  add_index "subscriptions", ["order"], :name => "index_subscriptions_on_order"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                                            :null => false
    t.string   "last_name",                                             :null => false
    t.string   "zipcode",                                               :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
