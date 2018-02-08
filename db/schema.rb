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

ActiveRecord::Schema.define(version: 20180208135507) do

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

  create_table "bcgs", force: :cascade do |t|
    t.date "primeira_dose"
    t.date "segunda_dose"
    t.boolean "cicatriz"
    t.bigint "notificacao_contato_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificacao_contato_id"], name: "index_bcgs_on_notificacao_contato_id"
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
    t.integer "pacientes_count"
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

  create_table "conduta", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conduta_recidivas", force: :cascade do |t|
    t.bigint "conduta_id"
    t.bigint "recidiva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conduta_id"], name: "index_conduta_recidivas_on_conduta_id"
    t.index ["recidiva_id"], name: "index_conduta_recidivas_on_recidiva_id"
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

  create_table "dermatologicas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dermatologico_recidivas", force: :cascade do |t|
    t.bigint "dermatologica_id"
    t.string "momento"
    t.bigint "recidiva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dermatologica_id"], name: "index_dermatologico_recidivas_on_dermatologica_id"
    t.index ["recidiva_id"], name: "index_dermatologico_recidivas_on_recidiva_id"
  end

  create_table "diagnostico_recidivas", force: :cascade do |t|
    t.bigint "recidiva_id"
    t.bigint "diagnostico_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnostico_id"], name: "index_diagnostico_recidivas_on_diagnostico_id"
    t.index ["recidiva_id"], name: "index_diagnostico_recidivas_on_recidiva_id"
  end

  create_table "diagnosticos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "epidosios_reacionais_recidivas", force: :cascade do |t|
    t.string "tipo"
    t.string "conduta_mendicamentosa"
    t.string "momento"
    t.bigint "recidiva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numero_episodios"
    t.index ["recidiva_id"], name: "index_epidosios_reacionais_recidivas_on_recidiva_id"
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

  create_table "marcacaos", force: :cascade do |t|
    t.bigint "avaliacao_sensitiva_id"
    t.string "imagem"
    t.integer "posicaox"
    t.integer "posicaoy"
    t.string "membro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaliacao_sensitiva_id"], name: "index_marcacaos_on_avaliacao_sensitiva_id"
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

  create_table "nervos_recidivas", force: :cascade do |t|
    t.string "nervo"
    t.bigint "recidiva_id"
    t.string "momento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recidiva_id"], name: "index_nervos_recidivas_on_recidiva_id"
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

  create_table "recidivas", force: :cascade do |t|
    t.string "unidade_saude"
    t.string "prontuario"
    t.date "data_diagnostico"
    t.string "classificacao_operacional"
    t.string "forma_clinica"
    t.string "baciloscopia"
    t.string "baciloscopia_lb"
    t.string "grau_incapacidade"
    t.date "inicio_tratamento"
    t.string "esquema_terapeutico"
    t.integer "tempo_tratamento"
    t.integer "doses"
    t.boolean "regularidade"
    t.string "tratamento_observacoes"
    t.integer "tempo_alta_cura"
    t.date "data_primeiros_sintomas"
    t.string "grau_incapacidade_alta"
    t.string "classificacao_operacional_alta"
    t.bigint "notificacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "termino_tratamento"
    t.string "forma_clinica_alta"
    t.string "baciloscopia_suspeita"
    t.string "baciloscopia_lb_suspeita"
    t.string "grau_incapacidade_suspeita"
    t.string "classificacao_operacional_suspeita"
    t.string "forma_clinica_suspeita"
    t.index ["notificacao_id"], name: "index_recidivas_on_notificacao_id"
  end

  create_table "sinais_sintomas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sintomas_recidivas", force: :cascade do |t|
    t.bigint "sinais_sintoma_id"
    t.bigint "recidiva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recidiva_id"], name: "index_sintomas_recidivas_on_recidiva_id"
    t.index ["sinais_sintoma_id"], name: "index_sintomas_recidivas_on_sinais_sintoma_id"
  end

  add_foreign_key "avaliacao_neurologicas", "avaliacao_notificacaos"
  add_foreign_key "avaliacao_neurologicas", "queixas"
  add_foreign_key "avaliacao_notificacaos", "notificacaos"
  add_foreign_key "avaliacao_sensitivas", "avaliacao_notificacaos"
  add_foreign_key "bcgs", "notificacao_contatos"
  add_foreign_key "classificacao_graus", "avaliacao_notificacaos"
  add_foreign_key "conduta_recidivas", "conduta", column: "conduta_id"
  add_foreign_key "conduta_recidivas", "recidivas"
  add_foreign_key "contato_avaliacaos", "notificacao_contatos"
  add_foreign_key "dados_clinicos", "notificacaos"
  add_foreign_key "dermatologico_recidivas", "dermatologicas"
  add_foreign_key "dermatologico_recidivas", "recidivas"
  add_foreign_key "diagnostico_recidivas", "diagnosticos"
  add_foreign_key "diagnostico_recidivas", "recidivas"
  add_foreign_key "epidosios_reacionais_recidivas", "recidivas"
  add_foreign_key "episodio_reacionals", "notificacaos"
  add_foreign_key "esquema_substitutivos", "medicamentos"
  add_foreign_key "esquema_substitutivos", "notificacaos"
  add_foreign_key "marcacaos", "avaliacao_sensitivas"
  add_foreign_key "nervos_recidivas", "recidivas"
  add_foreign_key "notificacao_contatos", "notificacaos"
  add_foreign_key "notificacaos", "pacientes"
  add_foreign_key "pacientes", "cidades"
  add_foreign_key "pacientes", "ocupacaos"
  add_foreign_key "queixas", "categoria_queixas"
  add_foreign_key "recidivas", "notificacaos"
  add_foreign_key "sintomas_recidivas", "recidivas"
  add_foreign_key "sintomas_recidivas", "sinais_sintomas"
end
