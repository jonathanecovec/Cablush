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

ActiveRecord::Schema.define(version: 20151025210726) do

  create_table "amizades", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "amigo_id"
    t.boolean  "aprovado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "amizades", ["amigo_id"], name: "index_amizades_on_amigo_id"
  add_index "amizades", ["usuario_id"], name: "index_amizades_on_usuario_id"

  create_table "cidades", force: :cascade do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "esportes", force: :cascade do |t|
    t.string   "nome"
    t.string   "categoria"
    t.string   "icone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "esportes_eventos", id: false, force: :cascade do |t|
    t.integer "evento_id",  null: false
    t.integer "esporte_id", null: false
  end

  create_table "esportes_grupos", id: false, force: :cascade do |t|
    t.integer "grupo_id",   null: false
    t.integer "esporte_id", null: false
  end

  create_table "esportes_lojas", id: false, force: :cascade do |t|
    t.integer "loja_id",    null: false
    t.integer "esporte_id", null: false
  end

  create_table "esportes_pistas", id: false, force: :cascade do |t|
    t.integer "pista_id",   null: false
    t.integer "esporte_id", null: false
  end

  create_table "esportes_usuarios", id: false, force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.integer "esporte_id", null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string   "rg",         limit: 2
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "nome"
    t.string   "descricao"
    t.date     "data"
    t.time     "hora"
    t.string   "website"
    t.string   "facebook"
    t.integer  "responsavel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "flyer_file_name"
    t.string   "flyer_content_type"
    t.integer  "flyer_file_size"
    t.datetime "flyer_updated_at"
    t.boolean  "fundo",              default: false
    t.string   "uuid",                               null: false
  end

  add_index "eventos", ["responsavel_id"], name: "index_eventos_on_responsavel_id"
  add_index "eventos", ["uuid"], name: "index_eventos_on_uuid", unique: true

  create_table "eventos_grupos", id: false, force: :cascade do |t|
    t.integer "grupo_id",  null: false
    t.integer "evento_id", null: false
  end

  create_table "eventos_lojas", id: false, force: :cascade do |t|
    t.integer "loja_id",   null: false
    t.integer "evento_id", null: false
  end

  create_table "grupos", force: :cascade do |t|
    t.string   "nome"
    t.string   "descricao"
    t.string   "logo"
    t.boolean  "fundo",          default: false
    t.integer  "responsavel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grupos", ["responsavel_id"], name: "index_grupos_on_responsavel_id"

  create_table "grupos_usuarios", id: false, force: :cascade do |t|
    t.integer "grupo_id",   null: false
    t.integer "usuario_id", null: false
  end

  create_table "horarios", force: :cascade do |t|
    t.string   "dias"
    t.string   "periodo"
    t.time     "inicio"
    t.time     "fim"
    t.integer  "funcionamento_id"
    t.string   "funcionamento_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "horarios", ["funcionamento_type", "funcionamento_id"], name: "index_horarios_on_funcionamento_type_and_funcionamento_id"

  create_table "locais", force: :cascade do |t|
    t.decimal  "latitude",         precision: 15, scale: 10, default: 0.0
    t.decimal  "longitude",        precision: 15, scale: 10, default: 0.0
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.string   "pais"
    t.integer  "localizavel_id"
    t.string   "localizavel_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locais", ["localizavel_type", "localizavel_id"], name: "index_locais_on_localizavel_type_and_localizavel_id"

  create_table "lojas", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.string   "telefone"
    t.string   "email"
    t.string   "website"
    t.string   "facebook"
    t.integer  "responsavel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "fundo",             default: false
    t.string   "uuid",                              null: false
  end

  add_index "lojas", ["responsavel_id"], name: "index_lojas_on_responsavel_id"
  add_index "lojas", ["uuid"], name: "index_lojas_on_uuid", unique: true

  create_table "pistas", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.string   "website"
    t.string   "facebook"
    t.integer  "responsavel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
    t.boolean  "fundo",             default: false
    t.string   "uuid",                              null: false
  end

  add_index "pistas", ["responsavel_id"], name: "index_pistas_on_responsavel_id"
  add_index "pistas", ["uuid"], name: "index_pistas_on_uuid", unique: true

  create_table "usuarios", force: :cascade do |t|
    t.integer  "id_social"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "role"
    t.string   "uuid",                                null: false
  end

  add_index "usuarios", ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  add_index "usuarios", ["unlock_token"], name: "index_usuarios_on_unlock_token", unique: true
  add_index "usuarios", ["uuid"], name: "index_usuarios_on_uuid", unique: true

end
