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

ActiveRecord::Schema.define(version: 20190905140445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avaliacao_neurologicas", force: :cascade do |t|
    t.bigint "avaliacao_notificacao_id"
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "olhos_sem_forca_d"
    t.decimal "olhos_sem_forca_e"
    t.decimal "olhos_com_forca_d"
    t.decimal "olhos_com_forca_e"
    t.string "triquiase_d"
    t.string "triquiase_e"
    t.string "ectropio_d"
    t.string "ectropio_e"
    t.string "catarata_d"
    t.string "catarata_e"
    t.string "sensibilidade_cornea_d"
    t.string "sensibilidade_cornea_e"
    t.string "opacidade_corneana_d"
    t.decimal "acuidade_visual_d"
    t.decimal "acuidade_visual_e"
    t.string "ressecamento_d"
    t.string "ressecamento_e"
    t.string "feridas_d"
    t.string "feridas_e"
    t.string "perfuracao_septo_d"
    t.string "nervo_radial_d"
    t.string "nervo_radial_e"
    t.string "nervo_ulnar_d"
    t.string "nervo_mediano_d"
    t.string "nervo_mediano_e"
    t.integer "abducao_5_dedo_d"
    t.integer "abducao_5_dedo_e"
    t.integer "abducao_polegar_d"
    t.integer "abducao_polegar_e"
    t.integer "extensores_punho_d"
    t.integer "extensores_punho_e"
    t.string "nervo_fibular_d"
    t.string "nervo_fibular_e"
    t.string "nervo_tibial_d"
    t.string "nervo_tibial_e"
    t.integer "extensao_halux_d"
    t.integer "extensao_halux_e"
    t.integer "dorsiflexao_pe_d"
    t.integer "dorsiflexao_pe_e"
    t.string "opacidade_corneana_e"
    t.string "perfuracao_septo_e"
    t.string "nervo_ulnar_e"
    t.index ["avaliacao_notificacao_id"], name: "index_avaliacao_neurologicas_on_avaliacao_notificacao_id"
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
    t.bigint "paciente_id"
    t.boolean "inicial"
    t.index ["notificacao_id"], name: "index_avaliacao_notificacaos_on_notificacao_id"
    t.index ["paciente_id"], name: "index_avaliacao_notificacaos_on_paciente_id"
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

  create_table "conduta_recidivas", force: :cascade do |t|
    t.bigint "condutas_id"
    t.bigint "recidiva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condutas_id"], name: "index_conduta_recidivas_on_condutas_id"
    t.index ["recidiva_id"], name: "index_conduta_recidivas_on_recidiva_id"
  end

  create_table "condutas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "dant_cidade_regions", force: :cascade do |t|
    t.bigint "dant_region_id"
    t.bigint "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_dant_cidade_regions_on_cidade_id"
    t.index ["dant_region_id"], name: "index_dant_cidade_regions_on_dant_region_id"
  end

  create_table "dant_doses", force: :cascade do |t|
    t.string "tipo_insulina"
    t.integer "dose_diaria"
    t.integer "frascos_mensais"
    t.bigint "dant_pacient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dant_pacient_id"], name: "index_dant_doses_on_dant_pacient_id"
  end

  create_table "dant_faixa_etaria", force: :cascade do |t|
    t.integer "hipertenso_m_1"
    t.integer "hipertenso_m_1_4"
    t.integer "hipertenso_m_5_9"
    t.integer "hipertenso_m_10_14"
    t.integer "hipertenso_m_15_19"
    t.integer "hipertenso_m_20_29"
    t.integer "hipertenso_m_30_39"
    t.integer "hipertenso_m_40_49"
    t.integer "hipertenso_m_50_59"
    t.integer "hipertenso_m_60_69"
    t.integer "hipertenso_m_70_79"
    t.integer "hipertenso_m_80"
    t.integer "hipertenso_f_1"
    t.integer "hipertenso_f_1_4"
    t.integer "hipertenso_f_5_9"
    t.integer "hipertenso_f_10_14"
    t.integer "hipertenso_f_15_19"
    t.integer "hipertenso_f_20_29"
    t.integer "hipertenso_f_30_39"
    t.integer "hipertenso_f_40_49"
    t.integer "hipertenso_f_50_59"
    t.integer "hipertenso_f_60_69"
    t.integer "hipertenso_f_70_79"
    t.integer "hipertenso_f_80"
    t.integer "diabetico_m_1"
    t.integer "diabetico_m_1_4"
    t.integer "diabetico_m_5_9"
    t.integer "diabetico_m_10_14"
    t.integer "diabetico_m_15_19"
    t.integer "diabetico_m_20_29"
    t.integer "diabetico_m_30_39"
    t.integer "diabetico_m_40_49"
    t.integer "diabetico_m_50_59"
    t.integer "diabetico_m_60_69"
    t.integer "diabetico_m_70_79"
    t.integer "diabetico_m_90"
    t.integer "diabetico_f_1"
    t.integer "diabetico_f_1_4"
    t.integer "diabetico_f_5_9"
    t.integer "diabetico_f_10_14"
    t.integer "diabetico_f_15_19"
    t.integer "diabetico_f_20_29"
    t.integer "diabetico_f_30_39"
    t.integer "diabetico_f_40_49"
    t.integer "diabetico_f_50_59"
    t.integer "diabetico_f_60_69"
    t.integer "diabetico_f_70_79"
    t.integer "diabetico_f_80"
    t.integer "diabetico_hipertenso_m_1"
    t.integer "diabetico_hipertenso_m_1_4"
    t.integer "diabetico_hipertenso_m_5_9"
    t.integer "diabetico_hipertenso_m_10_14"
    t.integer "diabetico_hipertenso_m_15_19"
    t.integer "diabetico_hipertenso_m_20_29"
    t.integer "diabetico_hipertenso_m_30_39"
    t.integer "diabetico_hipertenso_m_40_49"
    t.integer "diabetico_hipertenso_m_50_59"
    t.integer "diabetico_hipertenso_m_60_69"
    t.integer "diabetico_hipertenso_m_70_79"
    t.integer "diabetico_hipertenso_m_80"
    t.integer "diabetico_hipertenso_f_1"
    t.integer "diabetico_hipertenso_f_1_4"
    t.integer "diabetico_hipertenso_f_5_9"
    t.integer "diabetico_hipertenso_f_10_14"
    t.integer "diabetico_hipertenso_f_15_19"
    t.integer "diabetico_hipertenso_f_20_29"
    t.integer "diabetico_hipertenso_f_30_39"
    t.integer "diabetico_hipertenso_f_40_49"
    t.integer "diabetico_hipertenso_f_50_59"
    t.integer "diabetico_hipertenso_f_60_69"
    t.integer "diabetico_hipertenso_f_70_79"
    t.integer "diabetico_hipertenso_f_80"
    t.integer "obeso_m_1"
    t.integer "obeso_m_1_4"
    t.integer "obeso_m_5_9"
    t.integer "obeso_m_10_14"
    t.integer "obeso_m_15_19"
    t.integer "obeso_m_20_29"
    t.integer "obeso_m_30_39"
    t.integer "obeso_m_40_49"
    t.integer "obeso_m_50_59"
    t.integer "obeso_m_60_69"
    t.integer "obeso_m_70_79"
    t.integer "obeso_m_80"
    t.integer "obeso_f_1"
    t.integer "obeso_f_1_4"
    t.integer "obeso_f_5_9"
    t.integer "obeso_f_10_14"
    t.integer "obeso_f_15_19"
    t.integer "obeso_f_20_29"
    t.integer "obeso_f_30_39"
    t.integer "obeso_f_40_49"
    t.integer "obeso_f_50_59"
    t.integer "obeso_f_60_69"
    t.integer "obeso_f_70_79"
    t.integer "obeso_f_80"
    t.integer "tabagismo_m_1_8"
    t.integer "tabagismo_m_9_11"
    t.integer "tabagismo_m_12_17"
    t.integer "tabagismo_m_18_24"
    t.integer "tabagismo_m_25_34"
    t.integer "tabagismo_m_35_44"
    t.integer "tabagismo_m_45_54"
    t.integer "tabagismo_m_55_64"
    t.integer "tabagismo_m_65"
    t.integer "tabagismo_f_1_8"
    t.integer "tabagismo_f_9_11"
    t.integer "tabagismo_f_12_17"
    t.integer "tabagismo_f_18_24"
    t.integer "tabagismo_f_25_34"
    t.integer "tabagismo_f_35_44"
    t.integer "tabagismo_f_45_54"
    t.integer "tabagismo_f_55_64"
    t.integer "tabagismo_f_65"
    t.integer "etilismo_m_1_8"
    t.integer "etilismo_m_9_11"
    t.integer "etilismo_m_12_17"
    t.integer "etilismo_m_18_24"
    t.integer "etilismo_m_25_34"
    t.integer "etilismo_m_35_44"
    t.integer "etilismo_m_45_54"
    t.integer "etilismo_m_55_64"
    t.integer "etilismo_m_65"
    t.integer "etilismo_f_1_8"
    t.integer "etilismo_f_9_11"
    t.integer "etilismo_f_12_17"
    t.integer "etilismo_f_18_24"
    t.integer "etilismo_f_25_34"
    t.integer "etilismo_f_35_44"
    t.integer "etilismo_f_45_54"
    t.integer "etilismo_f_55_64"
    t.integer "etilismo_f_65"
    t.bigint "dant_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dant_request_id"], name: "index_dant_faixa_etaria_on_dant_request_id"
  end

  create_table "dant_pacients", force: :cascade do |t|
    t.string "nome"
    t.integer "sexo"
    t.string "endereco"
    t.string "rg"
    t.string "cpf"
    t.string "tipo_insulina"
    t.boolean "hipertenso"
    t.boolean "diabetico"
    t.boolean "tabagista"
    t.boolean "etilista"
    t.boolean "obeso"
    t.integer "grau_obesidade"
    t.bigint "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frascos_diarios"
    t.integer "frascos_mensais"
    t.boolean "obito"
    t.date "data_obito"
    t.date "data_nascimento"
    t.index ["cidade_id"], name: "index_dant_pacients_on_cidade_id"
  end

  create_table "dant_questions", force: :cascade do |t|
    t.integer "pergunta"
    t.string "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dant_regions", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dant_request_pacients", force: :cascade do |t|
    t.bigint "dant_request_id"
    t.bigint "dant_pacient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frascos_diarios"
    t.integer "frascos_mensais"
    t.integer "idade"
    t.boolean "hipertenso"
    t.boolean "diabetico"
    t.boolean "tabagista"
    t.boolean "obeso"
    t.boolean "etilista"
    t.integer "sexo"
    t.index ["dant_pacient_id"], name: "index_dant_request_pacients_on_dant_pacient_id"
    t.index ["dant_request_id"], name: "index_dant_request_pacients_on_dant_request_id"
  end

  create_table "dant_requests", force: :cascade do |t|
    t.integer "qtd_hipertensos"
    t.integer "atendimento_hipertensos"
    t.integer "qtd_obitos_hipertensos"
    t.integer "qtd_diabeticos"
    t.integer "atendimento_diabeticos"
    t.integer "qtd_obitos_diabeticos"
    t.integer "qtd_diabeticos_hipertencos"
    t.integer "atendimento_diabeticos_hipertensos"
    t.integer "qtd_tratamento_hemodialise"
    t.integer "qtd_nph"
    t.integer "qtd_frascos_nph"
    t.integer "qtd_regular"
    t.integer "qtd_frascos_regular"
    t.integer "qtd_analoga"
    t.integer "qtd_frascos_analoga"
    t.integer "qtd_tabagista"
    t.integer "qtd_atendimento_tabagista"
    t.integer "qtd_etilista"
    t.integer "qtd_atendimento_etilista"
    t.integer "qtd_obesos"
    t.integer "qtd_obesidade_1"
    t.integer "qtd_obesidate_2"
    t.integer "qtd_obesidade_3"
    t.integer "mes"
    t.bigint "dant_responsavel_program_id"
    t.bigint "cidade_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ano"
    t.integer "soma_participacoes"
    t.datetime "data_envio"
    t.integer "qtd_nph_calculada"
    t.integer "qtd_regular_calculada"
    t.integer "qtd_analoga_calculada"
    t.text "justificativa"
    t.index ["cidade_id"], name: "index_dant_requests_on_cidade_id"
    t.index ["dant_responsavel_program_id"], name: "index_dant_requests_on_dant_responsavel_program_id"
  end

  create_table "dant_responsavel_programs", force: :cascade do |t|
    t.string "nome"
    t.string "cargo"
    t.bigint "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_dant_responsavel_programs_on_cidade_id"
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

  create_table "dst_locals", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.bigint "cidade_id"
    t.string "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_dst_locals_on_cidade_id"
  end

  create_table "dst_lotes", force: :cascade do |t|
    t.bigint "dst_produto_id"
    t.string "nome"
    t.text "descricao"
    t.date "validade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dst_produto_id"], name: "index_dst_lotes_on_dst_produto_id"
  end

  create_table "dst_movimentacaos", force: :cascade do |t|
    t.bigint "dst_produto_id"
    t.string "tipo"
    t.string "categoria"
    t.decimal "quantidade"
    t.bigint "dst_lote_id"
    t.text "descricao"
    t.bigint "dst_local_id"
    t.bigint "dst_solicitacao_produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dst_local_id"], name: "index_dst_movimentacaos_on_dst_local_id"
    t.index ["dst_lote_id"], name: "index_dst_movimentacaos_on_dst_lote_id"
    t.index ["dst_produto_id"], name: "index_dst_movimentacaos_on_dst_produto_id"
    t.index ["dst_solicitacao_produto_id"], name: "index_dst_movimentacaos_on_dst_solicitacao_produto_id"
  end

  create_table "dst_produtos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "unidade_medida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dst_questionarios", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dst_resposta", force: :cascade do |t|
    t.bigint "dst_questionario_id"
    t.bigint "dst_solicitacao_id"
    t.string "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dst_questionario_id"], name: "index_dst_resposta_on_dst_questionario_id"
    t.index ["dst_solicitacao_id"], name: "index_dst_resposta_on_dst_solicitacao_id"
  end

  create_table "dst_solicitacao_produtos", force: :cascade do |t|
    t.bigint "dst_produto_id"
    t.decimal "quantidade"
    t.string "status"
    t.bigint "dst_solicitacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "distribuido"
    t.text "observacoes"
    t.decimal "quantidade_aprovada"
    t.bigint "user_id"
    t.index ["dst_produto_id"], name: "index_dst_solicitacao_produtos_on_dst_produto_id"
    t.index ["dst_solicitacao_id"], name: "index_dst_solicitacao_produtos_on_dst_solicitacao_id"
    t.index ["user_id"], name: "index_dst_solicitacao_produtos_on_user_id"
  end

  create_table "dst_solicitacaos", force: :cascade do |t|
    t.bigint "dst_local_id"
    t.text "observacoes"
    t.bigint "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["dst_local_id"], name: "index_dst_solicitacaos_on_dst_local_id"
    t.index ["user_id"], name: "index_dst_solicitacaos_on_user_id"
  end

  create_table "dst_user_locals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "dst_local_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dst_local_id"], name: "index_dst_user_locals_on_dst_local_id"
    t.index ["user_id"], name: "index_dst_user_locals_on_user_id"
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

  create_table "escala_parts", force: :cascade do |t|
    t.string "questao_1"
    t.integer "questao_1_valor"
    t.string "questao_2"
    t.integer "questao_2_valor"
    t.string "questao_3"
    t.integer "questao_3_valor"
    t.string "questao_4"
    t.integer "questao_4_valor"
    t.string "questao_5"
    t.integer "questao_5_valor"
    t.string "questao_6"
    t.integer "questao_6_valor"
    t.string "questao_7"
    t.integer "questao_7_valor"
    t.string "questao_8"
    t.integer "questao_8_valor"
    t.string "questao_9"
    t.integer "questao_9_valor"
    t.string "questao_10"
    t.integer "questao_10_valor"
    t.string "questao_11"
    t.integer "questao_11_valor"
    t.string "questao_12"
    t.integer "questao_12_valor"
    t.string "questao_13"
    t.integer "questao_13_valor"
    t.string "questao_14"
    t.integer "questao_14_valor"
    t.string "questao_15"
    t.integer "questao_15_valor"
    t.string "questao_16"
    t.integer "questao_16_valor"
    t.string "questao_17"
    t.integer "questao_17_valor"
    t.string "questao_18"
    t.integer "questao_18_valor"
    t.date "data_entrevista"
    t.string "entrevistador"
    t.string "grau_restricao"
    t.text "comentario"
    t.bigint "paciente_id"
    t.bigint "notificacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total"
    t.index ["notificacao_id"], name: "index_escala_parts_on_notificacao_id"
    t.index ["paciente_id"], name: "index_escala_parts_on_paciente_id"
  end

  create_table "escala_salsas", force: :cascade do |t|
    t.bigint "paciente_id"
    t.bigint "notificacao_id"
    t.date "data_entrevista"
    t.string "entrevistador"
    t.integer "questao_1"
    t.integer "questao_2"
    t.integer "questao_3"
    t.integer "questao_4"
    t.integer "questao_5"
    t.integer "questao_6"
    t.integer "questao_7"
    t.integer "questao_8"
    t.integer "questao_9"
    t.integer "questao_10"
    t.integer "questao_11"
    t.integer "questao_12"
    t.integer "questao_13"
    t.integer "questao_14"
    t.integer "questao_15"
    t.integer "questao_16"
    t.integer "questao_17"
    t.integer "questao_18"
    t.integer "questao_19"
    t.integer "questao_20"
    t.integer "escore_facil"
    t.integer "escore_pouco_dificil"
    t.integer "escore_muito_dificil"
    t.integer "escore_nao_preciso"
    t.integer "escore_fisicamente"
    t.integer "escore_evito"
    t.integer "escore_salsa"
    t.integer "escore_risco"
    t.text "condicoes_medicas"
    t.text "adaptacoes"
    t.string "responsavel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificacao_id"], name: "index_escala_salsas_on_notificacao_id"
    t.index ["paciente_id"], name: "index_escala_salsas_on_paciente_id"
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

  create_table "imunizacao_encerramentos", force: :cascade do |t|
    t.bigint "imunizacao_esquema_id"
    t.date "data_administracao"
    t.string "lote"
    t.date "validade"
    t.string "laboratorio"
    t.string "unidade_administracao"
    t.string "via_administracao"
    t.string "profissional"
    t.text "observacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imunizacao_esquema_id"], name: "index_imunizacao_encerramentos_on_imunizacao_esquema_id"
  end

  create_table "imunizacao_esquemas", force: :cascade do |t|
    t.string "dose"
    t.string "esquema"
    t.string "status"
    t.string "justificativa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "imunizacao_imunobiologico_id"
    t.index ["imunizacao_imunobiologico_id"], name: "index_imunizacao_esquemas_on_imunizacao_imunobiologico_id"
  end

  create_table "imunizacao_imunobiologicos", force: :cascade do |t|
    t.string "tipo"
    t.string "nome_vacina"
    t.bigint "imunizacao_vacina_id"
    t.bigint "imunizacao_solicitacao_id"
    t.string "status"
    t.text "justificativa_indeferimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "imunizacao_indication_id"
    t.index ["imunizacao_indication_id"], name: "index_imunizacao_imunobiologicos_on_imunizacao_indication_id"
    t.index ["imunizacao_solicitacao_id"], name: "index_imunizacao_imunobiologicos_on_imunizacao_solicitacao_id"
    t.index ["imunizacao_vacina_id"], name: "index_imunizacao_imunobiologicos_on_imunizacao_vacina_id"
  end

  create_table "imunizacao_indications", force: :cascade do |t|
    t.string "descricao"
    t.bigint "imunizacao_vacina_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imunizacao_vacina_id"], name: "index_imunizacao_indications_on_imunizacao_vacina_id"
  end

  create_table "imunizacao_solicitacaos", force: :cascade do |t|
    t.string "nome_paciente"
    t.date "data_nascimento"
    t.string "sexo"
    t.string "nome_mae"
    t.text "endereco"
    t.string "bairro"
    t.integer "municipio_id"
    t.text "motivo_solicitacao"
    t.string "nome_requisitante"
    t.string "tipo_requisitante"
    t.string "crm_coren"
    t.string "telefone_requisitante"
    t.string "instituicao_requisitante"
    t.integer "municipio_requisitante_id"
    t.text "anexo"
    t.string "solicitante"
    t.text "observacoes"
    t.date "data_atendimento"
    t.integer "municipio_atual_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "telefone_paciente"
    t.integer "idade"
    t.text "deferimento"
    t.json "anexos"
  end

  create_table "imunizacao_vacinas", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "monthly_reports", force: :cascade do |t|
    t.string "nome_grupo"
    t.string "coordenador"
    t.string "monitor"
    t.string "lider"
    t.date "data_reuniao"
    t.time "inicio"
    t.time "termino"
    t.string "local"
    t.text "temas"
    t.text "atividades_desenvolvidas"
    t.datetime "data_proximo"
    t.boolean "intercorrencia"
    t.integer "outros_agravos"
    t.integer "agravo_diabetes"
    t.integer "agravo_hipertensao"
    t.integer "agravo_avc"
    t.integer "analfabetos"
    t.integer "qtd_psicologo"
    t.integer "qtd_assistente_social"
    t.integer "oficina_sapataria"
    t.integer "qtd_hanseniase"
    t.integer "qtd_sem_hanseniase"
    t.integer "qtd_profissionais"
    t.bigint "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_monthly_reports_on_cidade_id"
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
    t.bigint "recidiva_id"
    t.bigint "avaliacao_notificacao_id"
    t.index ["avaliacao_notificacao_id"], name: "index_notificacaos_on_avaliacao_notificacao_id"
    t.index ["paciente_id"], name: "index_notificacaos_on_paciente_id"
    t.index ["recidiva_id"], name: "index_notificacaos_on_recidiva_id"
  end

  create_table "ocupacaos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "termino_tratamento"
    t.string "forma_clinica_alta"
    t.string "baciloscopia_suspeita"
    t.string "baciloscopia_lb_suspeita"
    t.string "grau_incapacidade_suspeita"
    t.string "classificacao_operacional_suspeita"
    t.string "forma_clinica_suspeita"
    t.bigint "paciente_id"
    t.index ["paciente_id"], name: "index_recidivas_on_paciente_id"
  end

  create_table "sensitiva_images", force: :cascade do |t|
    t.string "imagem"
    t.bigint "avaliacao_sensitiva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "opcao"
    t.index ["avaliacao_sensitiva_id"], name: "index_sensitiva_images_on_avaliacao_sensitiva_id"
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

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "email"
    t.bigint "cidade_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["cidade_id"], name: "index_users_on_cidade_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "avaliacao_neurologicas", "avaliacao_notificacaos"
  add_foreign_key "avaliacao_notificacaos", "notificacaos"
  add_foreign_key "avaliacao_notificacaos", "pacientes"
  add_foreign_key "avaliacao_sensitivas", "avaliacao_notificacaos"
  add_foreign_key "classificacao_graus", "avaliacao_notificacaos"
  add_foreign_key "conduta_recidivas", "condutas", column: "condutas_id"
  add_foreign_key "conduta_recidivas", "recidivas"
  add_foreign_key "contato_avaliacaos", "notificacao_contatos"
  add_foreign_key "dados_clinicos", "notificacaos"
  add_foreign_key "dant_cidade_regions", "cidades"
  add_foreign_key "dant_cidade_regions", "dant_regions"
  add_foreign_key "dant_doses", "dant_pacients"
  add_foreign_key "dant_faixa_etaria", "dant_requests"
  add_foreign_key "dant_pacients", "cidades"
  add_foreign_key "dant_request_pacients", "dant_pacients"
  add_foreign_key "dant_request_pacients", "dant_requests"
  add_foreign_key "dant_requests", "cidades"
  add_foreign_key "dant_requests", "dant_responsavel_programs"
  add_foreign_key "dant_responsavel_programs", "cidades"
  add_foreign_key "dermatologico_recidivas", "dermatologicas"
  add_foreign_key "dermatologico_recidivas", "recidivas"
  add_foreign_key "diagnostico_recidivas", "diagnosticos"
  add_foreign_key "diagnostico_recidivas", "recidivas"
  add_foreign_key "dst_locals", "cidades"
  add_foreign_key "dst_lotes", "dst_produtos"
  add_foreign_key "dst_movimentacaos", "dst_locals"
  add_foreign_key "dst_movimentacaos", "dst_lotes"
  add_foreign_key "dst_movimentacaos", "dst_produtos"
  add_foreign_key "dst_movimentacaos", "dst_solicitacao_produtos"
  add_foreign_key "dst_resposta", "dst_questionarios"
  add_foreign_key "dst_resposta", "dst_solicitacaos"
  add_foreign_key "dst_solicitacao_produtos", "dst_produtos"
  add_foreign_key "dst_solicitacao_produtos", "dst_solicitacaos"
  add_foreign_key "dst_solicitacao_produtos", "users"
  add_foreign_key "dst_solicitacaos", "dst_locals"
  add_foreign_key "dst_solicitacaos", "users"
  add_foreign_key "dst_user_locals", "dst_locals"
  add_foreign_key "dst_user_locals", "users"
  add_foreign_key "epidosios_reacionais_recidivas", "recidivas"
  add_foreign_key "episodio_reacionals", "notificacaos"
  add_foreign_key "escala_parts", "notificacaos"
  add_foreign_key "escala_parts", "pacientes"
  add_foreign_key "escala_salsas", "notificacaos"
  add_foreign_key "escala_salsas", "pacientes"
  add_foreign_key "esquema_substitutivos", "medicamentos"
  add_foreign_key "esquema_substitutivos", "notificacaos"
  add_foreign_key "imunizacao_encerramentos", "imunizacao_esquemas"
  add_foreign_key "imunizacao_esquemas", "imunizacao_imunobiologicos"
  add_foreign_key "imunizacao_imunobiologicos", "imunizacao_indications"
  add_foreign_key "imunizacao_imunobiologicos", "imunizacao_solicitacaos"
  add_foreign_key "imunizacao_imunobiologicos", "imunizacao_vacinas"
  add_foreign_key "imunizacao_indications", "imunizacao_vacinas"
  add_foreign_key "marcacaos", "avaliacao_sensitivas"
  add_foreign_key "monthly_reports", "cidades"
  add_foreign_key "nervos_recidivas", "recidivas"
  add_foreign_key "notificacao_contatos", "notificacaos"
  add_foreign_key "notificacaos", "avaliacao_notificacaos"
  add_foreign_key "notificacaos", "pacientes"
  add_foreign_key "notificacaos", "recidivas"
  add_foreign_key "pacientes", "cidades"
  add_foreign_key "pacientes", "ocupacaos"
  add_foreign_key "queixas", "categoria_queixas"
  add_foreign_key "recidivas", "pacientes"
  add_foreign_key "sensitiva_images", "avaliacao_sensitivas"
  add_foreign_key "sintomas_recidivas", "recidivas"
  add_foreign_key "sintomas_recidivas", "sinais_sintomas"
  add_foreign_key "users", "cidades"
end
