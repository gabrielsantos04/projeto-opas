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

ActiveRecord::Schema.define(version: 20180126135942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avaliacao_neurologicas", force: :cascade do |t|
    t.bigint "queixa_id"
    t.bigint "avaliacao_notificacao_id"
    t.string "direito"
    t.string "esquerdo"
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaliacao_notificacao_id"], name: "index_avaliacao_neurologicas_on_avaliacao_notificacao_id"
    t.index ["queixa_id"], name: "index_avaliacao_neurologicas_on_queixa_id"
  end

  create_table "avaliacao_notificacaos", force: :cascade do |t|
    t.string "classificacao_operacional"
    t.date "inicio_pqt"
    t.date "alta_pqt"
    t.string "profissao"
    t.string "unidade_saude"
    t.boolean "atividades_realizadas_ubs"
    t.boolean "grupo_autocuidado"
    t.string "encaminhamentos"
    t.string "imobilizacoes"
    t.string "adaptacoes"
    t.string "observacoes"
    t.bigint "notificacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "atividades_orientadas"
    t.index ["notificacao_id"], name: "index_avaliacao_notificacaos_on_notificacao_id"
  end

  create_table "avaliacao_sensitivas", force: :cascade do |t|
    t.bigint "avaliacao_notificacao_id"
    t.date "data"
    t.integer "dedao_direito"
    t.integer "indicador_d_ponta"
    t.integer "indicador_d"
    t.integer "mindinho_d_ponta"
    t.integer "mindinho_d"
    t.integer "mao_direita"
    t.integer "mao_d_costa"
    t.integer "dedao_esquerdo"
    t.integer "indicador_e_ponta"
    t.integer "indicador_e"
    t.integer "mindinho_e_ponta"
    t.integer "mindinho_e"
    t.integer "mao_esquerda"
    t.integer "mao_e_costa"
    t.integer "pe_direito"
    t.integer "pe_d_1_ponta"
    t.integer "pe_d_3_ponta"
    t.integer "pe_d_5_ponta"
    t.integer "pe_d_1"
    t.integer "pe_d_3"
    t.integer "pe_d_5"
    t.integer "pe_d_e1"
    t.integer "pe_d_calcanhar"
    t.integer "pe_esquerdo"
    t.integer "pe_e_1_ponta"
    t.integer "pe_e_3_ponta"
    t.integer "pe_e_5_ponta"
    t.integer "pe_e_1"
    t.integer "pe_e_3"
    t.integer "pe_e_5"
    t.integer "pe_e_e1"
    t.integer "pe_e_e2"
    t.integer "pe_e_calcanhar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pe_d_e2"
    t.index ["avaliacao_notificacao_id"], name: "index_avaliacao_sensitivas_on_avaliacao_notificacao_id"
  end

  create_table "categoria_queixas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.string "uf"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pacientes_count", default: 0
  end

  create_table "classificacao_graus", force: :cascade do |t|
    t.bigint "avaliacao_notificacao_id"
    t.date "data"
    t.integer "olho_direito"
    t.integer "olho_esquerdo"
    t.integer "mao_direita"
    t.integer "mao_esqueda"
    t.integer "pe_direito"
    t.integer "pe_esquerdo"
    t.integer "maior_grau"
    t.integer "escore_omp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaliacao_notificacao_id"], name: "index_classificacao_graus_on_avaliacao_notificacao_id"
  end

  create_table "contato_avaliacaos", force: :cascade do |t|
    t.date "data"
    t.boolean "suspeito"
    t.boolean "confirmado"
    t.bigint "notificacao_contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificacao_contato_id"], name: "index_contato_avaliacaos_on_notificacao_contato_id"
  end

  create_table "dados_clinicos", force: :cascade do |t|
    t.integer "lesoes_cultaneas"
    t.string "forma_clinica"
    t.string "classificacao_operacional"
    t.integer "nervos_afetados"
    t.bigint "notificacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificacao_id"], name: "index_dados_clinicos_on_notificacao_id"
  end

  create_table "episodio_reacionals", force: :cascade do |t|
    t.bigint "notificacao_id"
    t.string "tipo"
    t.integer "numero_episodios"
    t.string "conduta_mendicamentosa"
    t.date "data_inicio"
    t.date "data_termino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificacao_id"], name: "index_episodio_reacionals_on_notificacao_id"
  end

  create_table "esquema_substitutivos", force: :cascade do |t|
    t.decimal "miligramas"
    t.bigint "medicamento_id"
    t.bigint "notificacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicamento_id"], name: "index_esquema_substitutivos_on_medicamento_id"
    t.index ["notificacao_id"], name: "index_esquema_substitutivos_on_notificacao_id"
  end

  create_table "medicamentos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monofilamentos", force: :cascade do |t|
    t.string "nome"
    t.string "cor"
    t.string "interpretacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notificacao_contatos", force: :cascade do |t|
    t.string "nome"
    t.string "tipo_contato"
    t.boolean "suspeito"
    t.boolean "confirmado"
    t.bigint "notificacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "bcg_primeira"
    t.date "bcg_segunda"
    t.boolean "bcg_cicatriz"
    t.index ["notificacao_id"], name: "index_notificacao_contatos_on_notificacao_id"
  end

  create_table "notificacaos", force: :cascade do |t|
    t.string "numero"
    t.date "data"
    t.string "grau_incapacidade"
    t.string "modo_entrada"
    t.string "modo_deteccao"
    t.string "observacoes"
    t.string "baciloscopia"
    t.date "data_inicio"
    t.string "esquema_terapeutico"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "paciente_id"
    t.index ["paciente_id"], name: "index_notificacaos_on_paciente_id"
  end

  create_table "ocupacaos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.string "nome_mae"
    t.integer "idade"
    t.decimal "peso"
    t.string "endereco"
    t.string "latitude"
    t.string "longitude"
    t.integer "sexo"
    t.string "telefone"
    t.bigint "cidade_id"
    t.bigint "ocupacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_pacientes_on_cidade_id"
    t.index ["ocupacao_id"], name: "index_pacientes_on_ocupacao_id"
  end

  create_table "queixas", force: :cascade do |t|
    t.string "nome"
    t.string "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categoria_queixa_id"
    t.index ["categoria_queixa_id"], name: "index_queixas_on_categoria_queixa_id"
  end

  add_foreign_key "avaliacao_neurologicas", "avaliacao_notificacaos"
  add_foreign_key "avaliacao_neurologicas", "queixas"
  add_foreign_key "avaliacao_notificacaos", "notificacaos"
  add_foreign_key "avaliacao_sensitivas", "avaliacao_notificacaos"
  add_foreign_key "classificacao_graus", "avaliacao_notificacaos"
  add_foreign_key "contato_avaliacaos", "notificacao_contatos"
  add_foreign_key "dados_clinicos", "notificacaos"
  add_foreign_key "episodio_reacionals", "notificacaos"
  add_foreign_key "esquema_substitutivos", "medicamentos"
  add_foreign_key "esquema_substitutivos", "notificacaos"
  add_foreign_key "notificacao_contatos", "notificacaos"
  add_foreign_key "notificacaos", "pacientes"
  add_foreign_key "pacientes", "cidades"
  add_foreign_key "pacientes", "ocupacaos"
  add_foreign_key "queixas", "categoria_queixas"
end
