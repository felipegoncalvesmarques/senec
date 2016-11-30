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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161127131154) do

  create_table "activities", force: :cascade do |t|
    t.string   "titulo",                   limit: 255,                null: false
    t.string   "descricao",                limit: 255,                null: false
    t.string   "local",                    limit: 255,                null: false
    t.integer  "numero_de_vagas",          limit: 4,                  null: false
    t.integer  "criado_por_id",            limit: 4,                  null: false
    t.integer  "atualizado_por_id",        limit: 4
    t.datetime "data_horario",                                        null: false
    t.datetime "data_limite_de_inscricao",                            null: false
    t.boolean  "esta_ativo",                           default: true, null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "activities", ["atualizado_por_id"], name: "fk_rails_1005715734", using: :btree
  add_index "activities", ["criado_por_id"], name: "fk_rails_a7a59aa2d1", using: :btree

  create_table "activity_speakers", force: :cascade do |t|
    t.integer  "activity_id",       limit: 4
    t.integer  "speaker_id",        limit: 4
    t.integer  "criado_por_id",     limit: 4
    t.integer  "atualizado_por_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "activity_speakers", ["activity_id"], name: "index_activity_speakers_on_activity_id", using: :btree
  add_index "activity_speakers", ["atualizado_por_id"], name: "fk_rails_dcede69a34", using: :btree
  add_index "activity_speakers", ["criado_por_id"], name: "fk_rails_1eddf7be75", using: :btree
  add_index "activity_speakers", ["speaker_id"], name: "index_activity_speakers_on_speaker_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "nome",              limit: 255,                  null: false
    t.integer  "criado_por_id",     limit: 4,                    null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.text     "descricao",         limit: 65535,                null: false
    t.string   "endereco",          limit: 255,                  null: false
    t.string   "logo",              limit: 255,                  null: false
    t.string   "telefone",          limit: 255,                  null: false
    t.boolean  "esta_ativo",                      default: true, null: false
    t.integer  "atualizado_por_id", limit: 4
  end

  add_index "companies", ["atualizado_por_id"], name: "fk_rails_2c61c18a62", using: :btree
  add_index "companies", ["criado_por_id"], name: "fk_rails_806dfc5982", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.string   "pontos_positivos", limit: 255
    t.string   "pontos_negativos", limit: 255
    t.integer  "nota",             limit: 4
    t.integer  "participant_id",   limit: 4,                  null: false
    t.integer  "activity_id",      limit: 4,                  null: false
    t.boolean  "esta_ativo",                   default: true, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "feedbacks", ["activity_id"], name: "index_feedbacks_on_activity_id", using: :btree
  add_index "feedbacks", ["participant_id"], name: "index_feedbacks_on_participant_id", using: :btree

  create_table "organizers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nome",                   limit: 255,                null: false
    t.string   "telefone",               limit: 255,                null: false
    t.boolean  "esta_ativo",                         default: true, null: false
  end

  add_index "organizers", ["email"], name: "index_organizers_on_email", unique: true, using: :btree
  add_index "organizers", ["reset_password_token"], name: "index_organizers_on_reset_password_token", unique: true, using: :btree

  create_table "participants", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nome",                   limit: 255,                null: false
    t.string   "telefone",               limit: 255,                null: false
    t.string   "instituto",              limit: 255,                null: false
    t.string   "curso",                  limit: 255,                null: false
    t.boolean  "esta_ativo",                         default: true, null: false
    t.integer  "ano",                    limit: 4,                  null: false
  end

  add_index "participants", ["email"], name: "index_participants_on_email", unique: true, using: :btree
  add_index "participants", ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true, using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nome",                   limit: 255
    t.string   "telefone",               limit: 255
    t.integer  "company_id",             limit: 4
    t.boolean  "esta_ativo",                         default: true, null: false
  end

  add_index "partners", ["company_id"], name: "fk_rails_abe05c2d48", using: :btree
  add_index "partners", ["email"], name: "index_partners_on_email", unique: true, using: :btree
  add_index "partners", ["reset_password_token"], name: "index_partners_on_reset_password_token", unique: true, using: :btree

  create_table "presences", force: :cascade do |t|
    t.integer  "participant_id", limit: 4,                null: false
    t.integer  "activity_id",    limit: 4,                null: false
    t.boolean  "esta_ativo",               default: true, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "presences", ["activity_id"], name: "index_presences_on_activity_id", using: :btree
  add_index "presences", ["participant_id"], name: "index_presences_on_participant_id", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.integer  "company_id",        limit: 4,                  null: false
    t.integer  "criado_por_id",     limit: 4,                  null: false
    t.integer  "atualizado_por_id", limit: 4
    t.string   "nome",              limit: 255,                null: false
    t.string   "descricao",         limit: 255,                null: false
    t.string   "telefone",          limit: 255,                null: false
    t.boolean  "esta_ativo",                    default: true, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "speakers", ["atualizado_por_id"], name: "fk_rails_db232369d7", using: :btree
  add_index "speakers", ["company_id"], name: "index_speakers_on_company_id", using: :btree
  add_index "speakers", ["criado_por_id"], name: "fk_rails_211d0c4ea6", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "activity_id",    limit: 4,                null: false
    t.integer  "participant_id", limit: 4,                null: false
    t.boolean  "esta_ativo",               default: true, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "subscriptions", ["activity_id"], name: "index_subscriptions_on_activity_id", using: :btree
  add_index "subscriptions", ["participant_id"], name: "index_subscriptions_on_participant_id", using: :btree

  add_foreign_key "activities", "organizers", column: "atualizado_por_id"
  add_foreign_key "activities", "organizers", column: "criado_por_id"
  add_foreign_key "activity_speakers", "activities"
  add_foreign_key "activity_speakers", "organizers", column: "atualizado_por_id"
  add_foreign_key "activity_speakers", "organizers", column: "criado_por_id"
  add_foreign_key "activity_speakers", "speakers"
  add_foreign_key "companies", "organizers", column: "atualizado_por_id"
  add_foreign_key "companies", "organizers", column: "criado_por_id"
  add_foreign_key "feedbacks", "activities"
  add_foreign_key "feedbacks", "participants"
  add_foreign_key "partners", "companies"
  add_foreign_key "presences", "activities"
  add_foreign_key "presences", "participants"
  add_foreign_key "speakers", "companies"
  add_foreign_key "speakers", "organizers", column: "atualizado_por_id"
  add_foreign_key "speakers", "organizers", column: "criado_por_id"
  add_foreign_key "subscriptions", "activities"
  add_foreign_key "subscriptions", "participants"
end
