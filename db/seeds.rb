Monofilamento.create!([
    {nome: "Verde", cor: "#006600", interpretacao: ""},
    {nome: "Azul", cor: "#0066ff", interpretacao: ""},
    {nome: "Violeta", cor: "#cc33ff", interpretacao: ""},
    {nome: "Vermelho", cor: "#ff0000", interpretacao: ""},
    {nome: "Laranja", cor: "#ff6600", interpretacao: ""},
    {nome: "Rosa", cor: "#ff1ab3", interpretacao: ""}
])
CategoriaQueixa.create!([
      {nome: "Olhos"},
      {nome: "Nariz"},
      {nome: "Membros Superiores"},
      {nome: "Membros Inferiores"}
  ])
Queixa.create!([
     {nome: "Fecha olhos sem força (mm)", categoria: "olhos", categoria_queixa_id: 1},
     {nome: "Fecha olhos com força (mm)", categoria: "olhos", categoria_queixa_id: 1},
     {nome: "Triquíase (S / N)", categoria: "olhos", categoria_queixa_id: 1},
     {nome: "Ectrópio ( S / N )", categoria: "olhos", categoria_queixa_id: 1},
     {nome: "Catarata ( S / N )", categoria: "olhos", categoria_queixa_id: 1},
     {nome: "Dimin. Sensibilidade da Córnea ( S / N )", categoria: "olhos", categoria_queixa_id: 1},
     {nome: "Opacidade Corneana Cetral", categoria: "olhos", categoria_queixa_id: 1},
     {nome: "Acuidade Visual", categoria: "olhos", categoria_queixa_id: 1},
     {nome: "Ressecamento", categoria: "nariz", categoria_queixa_id: 2},
     {nome: "Feridas", categoria: "nariz", categoria_queixa_id: 2},
     {nome: "Perfuração de Septo", categoria: "nariz", categoria_queixa_id: 2},
     {nome: "Nervo Radial", categoria: "membros_superiores", categoria_queixa_id: 3},
     {nome: "Nervo Ulnar", categoria: "membros_superiores", categoria_queixa_id: 3},
     {nome: "Nervo mediano", categoria: "membros_superiores", categoria_queixa_id: 3},
     {nome: "Abdução do 5° dedo", categoria: "membros_superiores", categoria_queixa_id: 3},
     {nome: "Abdução do polegar", categoria: "membros_superiores", categoria_queixa_id: 3},
     {nome: "Extensores do punho", categoria: "membros_superiores", categoria_queixa_id: 3},
     {nome: "Nervo Fibular", categoria: "membros_inferiores", categoria_queixa_id: 4},
     {nome: "Nervo Tibial Posterior", categoria: "membros_inferiores", categoria_queixa_id: 4},
     {nome: "Extensão Hálux", categoria: "membros_inferiores", categoria_queixa_id: 4},
     {nome: "Dorsiflexão do pé", categoria: "membros_inferiores", categoria_queixa_id: 4}
 ])


Cidade.create!([
  {nome: "GURUPI", uf: "TO", latitude: "-11,72", longitude: "-49,06", pacientes_count: -1},
  {nome: "NAZARE", uf: "TO", latitude: "-6,37", longitude: "-47,66", pacientes_count: 0},
  {nome: "MURICILANDIA", uf: "TO", latitude: "-7,14", longitude: "-48,61", pacientes_count: 0},
  {nome: "PALMEIRAS DO TOCANTINS", uf: "TO", latitude: nil, longitude: nil, pacientes_count: 0},
  {nome: "PAU D'ARCO", uf: "TO", latitude: nil, longitude: nil, pacientes_count: 0},
  {nome: "ABREULANDIA", uf: "TO", latitude: "-9,62", longitude: "-49,15", pacientes_count: 0},
  {nome: "AGUIARNOPOLIS", uf: "TO", latitude: "-6,56", longitude: "-47,46", pacientes_count: 0},
  {nome: "ALIANCA DO TOCANTINS", uf: "TO", latitude: "-11,3", longitude: "-48,93", pacientes_count: 0},
  {nome: "ALMAS", uf: "TO", latitude: "-11,57", longitude: "-47,17", pacientes_count: 0},
  {nome: "ALVORADA", uf: "TO", latitude: "-12,48", longitude: "-49,12", pacientes_count: 0},
  {nome: "ANANAS", uf: "TO", latitude: "-6,36", longitude: "-48,07", pacientes_count: 0},
  {nome: "APARECIDA DO RIO NEGRO", uf: "TO", latitude: "-9,95", longitude: "-47,97", pacientes_count: 0},
  {nome: "ARAGOMINAS", uf: "TO", latitude: "-7,16", longitude: "-48,52", pacientes_count: 0},
  {nome: "ARAGUACEMA", uf: "TO", latitude: "-8,8", longitude: "-49,55", pacientes_count: 0},
  {nome: "ARAGUACU", uf: "TO", latitude: "-12,93", longitude: "-49,82", pacientes_count: 0},
  {nome: "ARAGUAINA", uf: "TO", latitude: "-7,19", longitude: "-48,2", pacientes_count: 0},
  {nome: "ARAGUATINS", uf: "TO", latitude: "-5,65", longitude: "-48,12", pacientes_count: 0},
  {nome: "ARAPOEMA", uf: "TO", latitude: "-7,65", longitude: "-49,06", pacientes_count: 0},
  {nome: "ARRAIAS", uf: "TO", latitude: "-12,93", longitude: "-46,93", pacientes_count: 0},
  {nome: "AUGUSTINOPOLIS", uf: "TO", latitude: "-5,46", longitude: "-47,88", pacientes_count: 0},
  {nome: "AURORA DO TOCANTINS", uf: "TO", latitude: "-12,71", longitude: "-46,4", pacientes_count: 0},
  {nome: "AXIXA DO TOCANTINS", uf: "TO", latitude: "-5,61", longitude: "-47,76", pacientes_count: 0},
  {nome: "BABACULANDIA", uf: "TO", latitude: "-7,2", longitude: "-47,75", pacientes_count: 0},
  {nome: "BARRA DO OURO", uf: "TO", latitude: "-7,68", longitude: "-47,68", pacientes_count: 0},
  {nome: "BARROLANDIA", uf: "TO", latitude: "-9,83", longitude: "-48,72", pacientes_count: 0},
  {nome: "BERNARDO SAYAO", uf: "TO", latitude: "-7,87", longitude: "-48,88", pacientes_count: 0},
  {nome: "BOM JESUS DO TOCANTINS", uf: "TO", latitude: "-8,96", longitude: "-48,16", pacientes_count: 0},
  {nome: "BRASILANDIA DO TOCANTINS", uf: "TO", latitude: "-8,38", longitude: "-48,48", pacientes_count: 0},
  {nome: "BREJINHO DE NAZARE", uf: "TO", latitude: "-11", longitude: "-48,56", pacientes_count: 0},
  {nome: "BURITI DO TOCANTINS", uf: "TO", latitude: "-5,31", longitude: "-48,22", pacientes_count: 0},
  {nome: "CACHOEIRINHA", uf: "TO", latitude: "-6,12", longitude: "-47,92", pacientes_count: 0},
  {nome: "CARIRI DO TOCANTINS", uf: "TO", latitude: "-11,89", longitude: "-49,16", pacientes_count: 0},
  {nome: "CARMOLANDIA", uf: "TO", latitude: "-7,03", longitude: "-48,39", pacientes_count: 0},
  {nome: "CARRASCO BONITO", uf: "TO", latitude: "-5,32", longitude: "-48,03", pacientes_count: 0},
  {nome: "CASEARA", uf: "TO", latitude: "-9,27", longitude: "-49,95", pacientes_count: 0},
  {nome: "CENTENARIO", uf: "TO", latitude: "-8,95", longitude: "-47,33", pacientes_count: 0},
  {nome: "CHAPADA DA NATIVIDADE", uf: "TO", latitude: "-11,61", longitude: "-47,75", pacientes_count: 0},
  {nome: "COLINAS DO TOCANTINS", uf: "TO", latitude: "-8,05", longitude: "-48,47", pacientes_count: 0},
  {nome: "COLMEIA", uf: "TO", latitude: "-8,72", longitude: "-48,76", pacientes_count: 0},
  {nome: "COMBINADO", uf: "TO", latitude: "-12,79", longitude: "-46,53", pacientes_count: 0},
  {nome: "CONCEICAO DO TOCANTINS", uf: "TO", latitude: "-12,21", longitude: "-47,29", pacientes_count: 0},
  {nome: "COUTO DE MAGALHAES", uf: "TO", latitude: "-8,28", longitude: "-49,24", pacientes_count: 0},
  {nome: "CRISTALANDIA", uf: "TO", latitude: "-10,6", longitude: "-49,19", pacientes_count: 0},
  {nome: "CRIXAS DO TOCANTINS", uf: "TO", latitude: "-11,1", longitude: "-48,91", pacientes_count: 0},
  {nome: "DARCINOPOLIS", uf: "TO", latitude: "-6,71", longitude: "-47,76", pacientes_count: 0},
  {nome: "DIVINOPOLIS DO TOCANTINS", uf: "TO", latitude: "-9,8", longitude: "-49,21", pacientes_count: 0},
  {nome: "DOIS IRMAOS DO TOCANTINS", uf: "TO", latitude: "-9,25", longitude: "-49,06", pacientes_count: 0},
  {nome: "DUERE", uf: "TO", latitude: "-11,34", longitude: "-49,27", pacientes_count: 0},
  {nome: "ESPERANTINA", uf: "TO", latitude: "-5,34", longitude: "-48,51", pacientes_count: 0},
  {nome: "FATIMA", uf: "TO", latitude: "-10,76", longitude: "-48,9", pacientes_count: 0},
  {nome: "FIGUEIROPOLIS", uf: "TO", latitude: "-12,13", longitude: "-49,17", pacientes_count: 0},
  {nome: "FORMOSO DO ARAGUAIA", uf: "TO", latitude: "-11,79", longitude: "-49,52", pacientes_count: 0},
  {nome: "FORTALEZA DO TABOCAO", uf: "TO", latitude: "-9,05", longitude: "-48,51", pacientes_count: 0},
  {nome: "GOIANORTE", uf: "TO", latitude: "-8,77", longitude: "-48,93", pacientes_count: 0},
  {nome: "GOIATINS", uf: "TO", latitude: "-7,71", longitude: "-47,31", pacientes_count: 0},
  {nome: "GUARAI", uf: "TO", latitude: "-8,83", longitude: "-48,51", pacientes_count: 0},
  {nome: "IPUEIRAS", uf: "TO", latitude: "-11,23", longitude: "-48,46", pacientes_count: 0},
  {nome: "ITACAJA", uf: "TO", latitude: "-8,39", longitude: "-47,76", pacientes_count: 0},
  {nome: "ITAPIRATINS", uf: "TO", latitude: "-8,38", longitude: "-48,11", pacientes_count: 0},
  {nome: "ITAPORA DO TOCANTINS", uf: "TO", latitude: "-8,57", longitude: "-48,68", pacientes_count: 0},
  {nome: "JAU DO TOCANTINS", uf: "TO", latitude: "-12,65", longitude: "-48,59", pacientes_count: 0},
  {nome: "JUARINA", uf: "TO", latitude: "-8,11", longitude: "-49,06", pacientes_count: 0},
  {nome: "LAGOA DA CONFUSAO", uf: "TO", latitude: "-10,79", longitude: "-49,62", pacientes_count: 0},
  {nome: "LAGOA DO TOCANTINS", uf: "TO", latitude: "-10,37", longitude: "-47,55", pacientes_count: 0},
  {nome: "LAJEADO", uf: "TO", latitude: "-9,75", longitude: "-48,35", pacientes_count: 0},
  {nome: "LIZARDA", uf: "TO", latitude: "-9,59", longitude: "-46,67", pacientes_count: 0},
  {nome: "LUZINOPOLIS", uf: "TO", latitude: "-6,18", longitude: "-47,85", pacientes_count: 0},
  {nome: "MARIANOPOLIS DO TOCANTINS", uf: "TO", latitude: "-9,79", longitude: "-49,65", pacientes_count: 0},
  {nome: "MATEIROS", uf: "TO", latitude: "-10,54", longitude: "-46,42", pacientes_count: 0},
  {nome: "MAURILANDIA DO TOCANTINS", uf: "TO", latitude: "-5,95", longitude: "-47,5", pacientes_count: 0},
  {nome: "MIRACEMA DO TOCANTINS", uf: "TO", latitude: "-9,56", longitude: "-48,39", pacientes_count: 0},
  {nome: "MONTE DO CARMO", uf: "TO", latitude: "-10,76", longitude: "-48,1", pacientes_count: 0},
  {nome: "MONTE SANTO DO TOCANTINS", uf: "TO", latitude: "-10", longitude: "-48,99", pacientes_count: 0},
  {nome: "NOVA OLINDA", uf: "TO", latitude: "-7,63", longitude: "-48,42", pacientes_count: 0},
  {nome: "NOVA ROSALANDIA", uf: "TO", latitude: "-10,56", longitude: "-48,91", pacientes_count: 0},
  {nome: "NOVO ACORDO", uf: "TO", latitude: "-9,96", longitude: "-47,67", pacientes_count: 0},
  {nome: "NOVO ALEGRE", uf: "TO", latitude: "-12,93", longitude: "-46,57", pacientes_count: 0},
  {nome: "NOVO JARDIM", uf: "TO", latitude: "-11,82", longitude: "-46,62", pacientes_count: 0},
  {nome: "PALMEIRANTE", uf: "TO", latitude: "-7,86", longitude: "-47,92", pacientes_count: 0},
  {nome: "PALMEIROPOLIS", uf: "TO", latitude: "-13,04", longitude: "-48,4", pacientes_count: 0},
  {nome: "PARAISO DO TOCANTINS", uf: "TO", latitude: "-10,17", longitude: "-48,86", pacientes_count: 0},
  {nome: "PARANA", uf: "TO", latitude: "-12,61", longitude: "-47,88", pacientes_count: 0},
  {nome: "PORTO NACIONAL", uf: "TO", latitude: "-10,7", longitude: "-48,41", pacientes_count: 0},
  {nome: "PRAIA NORTE", uf: "TO", latitude: "-5,39", longitude: "-47,81", pacientes_count: 0},
  {nome: "PRESIDENTE KENNEDY", uf: "TO", latitude: "-8,53", longitude: "-48,5", pacientes_count: 0},
  {nome: "PUGMIL", uf: "TO", latitude: "-10,42", longitude: "-48,89", pacientes_count: 0},
  {nome: "RECURSOLANDIA", uf: "TO", latitude: "-8,72", longitude: "-47,24", pacientes_count: 0},
  {nome: "RIACHINHO", uf: "TO", latitude: "-6,43", longitude: "-48,13", pacientes_count: 0},
  {nome: "RIO DA CONCEICAO", uf: "TO", latitude: "-11,4", longitude: "-46,88", pacientes_count: 0},
  {nome: "RIO DOS BOIS", uf: "TO", latitude: "-9,29", longitude: "-48,46", pacientes_count: 0},
  {nome: "RIO SONO", uf: "TO", latitude: "-9,34", longitude: "-47,9", pacientes_count: 0},
  {nome: "SAMPAIO", uf: "TO", latitude: "-5,34", longitude: "-47,87", pacientes_count: 0},
  {nome: "SANDOLANDIA", uf: "TO", latitude: "-12,53", longitude: "-49,92", pacientes_count: 0},
  {nome: "SANTA FE DO ARAGUAIA", uf: "TO", latitude: "-7,15", longitude: "-48,72", pacientes_count: 0},
  {nome: "SANTA MARIA DO TOCANTINS", uf: "TO", latitude: "-8,79", longitude: "-47,79", pacientes_count: 0},
  {nome: "SANTA RITA DO TOCANTINS", uf: "TO", latitude: "-10,86", longitude: "-48,91", pacientes_count: 0},
  {nome: "SANTA ROSA DO TOCANTINS", uf: "TO", latitude: "-11,44", longitude: "-48,12", pacientes_count: 0},
  {nome: "PALMAS", uf: "TO", latitude: "-10,16", longitude: "-48,33", pacientes_count: 2},
  {nome: "NATIVIDADE", uf: "TO", latitude: "-11,71", longitude: "-47,72", pacientes_count: 0},
  {nome: "ANGICO", uf: "TO", latitude: "-6,39", longitude: "-47,86", pacientes_count: 0},
  {nome: "ARAGUANA", uf: "TO", latitude: "-6,58", longitude: "-48,64", pacientes_count: 0},
  {nome: "BANDEIRANTES DO TOCANTINS", uf: "TO", latitude: "-7,75", longitude: "-48,58", pacientes_count: 0},
  {nome: "CAMPOS LINDOS", uf: "TO", latitude: "-7,99", longitude: "-46,86", pacientes_count: 0},
  {nome: "CHAPADA DE AREIA", uf: "TO", latitude: "-10,14", longitude: "-49,14", pacientes_count: 0},
  {nome: "DIANOPOLIS", uf: "TO", latitude: "-11,62", longitude: "-46,82", pacientes_count: 0},
  {nome: "FILADELFIA", uf: "TO", latitude: "-7,33", longitude: "-47,49", pacientes_count: 0},
  {nome: "ITAGUATINS", uf: "TO", latitude: "-5,76", longitude: "-47,48", pacientes_count: 0},
  {nome: "LAVANDEIRA", uf: "TO", latitude: "-12,78", longitude: "-46,5", pacientes_count: 0},
  {nome: "MIRANORTE", uf: "TO", latitude: "-9,52", longitude: "-48,59", pacientes_count: 0},
  {nome: "OLIVEIRA DE FATIMA", uf: "TO", latitude: "-10,7", longitude: "-48,9", pacientes_count: 0},
  {nome: "PEDRO AFONSO", uf: "TO", latitude: "-8,96", longitude: "-48,17", pacientes_count: 0},
  {nome: "PEIXE", uf: "TO", latitude: "-12,02", longitude: "-48,53", pacientes_count: 0},
  {nome: "PEQUIZEIRO", uf: "TO", latitude: "-8,59", longitude: "-48,93", pacientes_count: 0},
  {nome: "PINDORAMA DO TOCANTINS", uf: "TO", latitude: "-11,13", longitude: "-47,57", pacientes_count: 0},
  {nome: "PIRAQUE", uf: "TO", latitude: "-6,77", longitude: "-48,29", pacientes_count: 0},
  {nome: "PIUM", uf: "TO", latitude: "-10,44", longitude: "-49,18", pacientes_count: 0},
  {nome: "PONTE ALTA DO BOM JESUS", uf: "TO", latitude: "-12,09", longitude: "-46,47", pacientes_count: 0},
  {nome: "PONTE ALTA DO TOCANTINS", uf: "TO", latitude: "-10,74", longitude: "-47,53", pacientes_count: 0},
  {nome: "PORTO ALEGRE DO TOCANTINS", uf: "TO", latitude: "-11,6", longitude: "-47,04", pacientes_count: 0},
  {nome: "SANTA TEREZA DO TOCANTINS", uf: "TO", latitude: "-10,28", longitude: "-47,8", pacientes_count: 0},
  {nome: "SANTA TEREZINHA DO TOCANTINS", uf: "TO", latitude: "-6,43", longitude: "-47,67", pacientes_count: 0},
  {nome: "SAO BENTO DO TOCANTINS", uf: "TO", latitude: "-5,91", longitude: "-48,06", pacientes_count: 0},
  {nome: "SAO FELIX DO TOCANTINS", uf: "TO", latitude: "-10,16", longitude: "-46,65", pacientes_count: 0},
  {nome: "SAO MIGUEL DO TOCANTINS", uf: "TO", latitude: "-5,55", longitude: "-47,57", pacientes_count: 0},
  {nome: "SAO SALVADOR DO TOCANTINS", uf: "TO", latitude: "-12,74", longitude: "-48,23", pacientes_count: 0},
  {nome: "SAO SEBASTIAO DO TOCANTINS", uf: "TO", latitude: "-5,25", longitude: "-48,2", pacientes_count: 0},
  {nome: "SAO VALERIO DA NATIVIDADE", uf: "TO", latitude: "-11,97", longitude: "-48,23", pacientes_count: 0},
  {nome: "SILVANOPOLIS", uf: "TO", latitude: "-11,14", longitude: "-48,16", pacientes_count: 0},
  {nome: "SITIO NOVO DO TOCANTINS", uf: "TO", latitude: "-5,6", longitude: "-47,63", pacientes_count: 0},
  {nome: "SUCUPIRA", uf: "TO", latitude: "-11,99", longitude: "-48,97", pacientes_count: 0},
  {nome: "TAGUATINGA", uf: "TO", latitude: "-12,4", longitude: "-46,43", pacientes_count: 0},
  {nome: "TAIPAS DO TOCANTINS", uf: "TO", latitude: "-12,18", longitude: "-46,98", pacientes_count: 0},
  {nome: "TALISMA", uf: "TO", latitude: "-12,79", longitude: "-49,09", pacientes_count: 0},
  {nome: "TOCANTINIA", uf: "TO", latitude: "-9,56", longitude: "-48,37", pacientes_count: 0},
  {nome: "TOCANTINOPOLIS", uf: "TO", latitude: "-6,32", longitude: "-47,41", pacientes_count: 0},
  {nome: "TUPIRAMA", uf: "TO", latitude: "-8,97", longitude: "-48,18", pacientes_count: 0},
  {nome: "TUPIRATINS", uf: "TO", latitude: "-8,39", longitude: "-48,11", pacientes_count: 0},
  {nome: "WANDERLANDIA", uf: "TO", latitude: "-6,84", longitude: "-47,96", pacientes_count: 0},
  {nome: "XAMBIOA", uf: "TO", latitude: "-6,41", longitude: "-48,53", pacientes_count: 0}
])
Medicamento.create!([
    {nome: "Medicamento 1"},
    {nome: "Medicamento 2"},
    {nome: "Medicamento 3"}
])
Ocupacao.create!([
     {nome: "Ocupação 1"},
     {nome: "Ocupação 2"},
     {nome: "Ocupação 3"}
 ])

Paciente.create!([
     {nome: "Paciente 2", nome_mae: "teste", idade: 12, peso: "12.0", endereco: "Q. 504 Norte Alameda 28, 38 - Plano Diretor Norte, Palmas - TO, Brasil", latitude: "-10.1672297", longitude: "-48.318615499999964", sexo: 2, telefone: "123", cidade_id: 92, ocupacao_id: 1},
     {nome: "Paciente 1", nome_mae: "Mãe", idade: 30, peso: "80.0", endereco: "804 sul alameda 2", latitude: "-10.167551", longitude: "-48.338700", sexo: 2, telefone: "123456", cidade_id: 92, ocupacao_id: 1},
     {nome: "Paciente 3", nome_mae: "teste", idade: 23, peso: "43.0", endereco: "teste", latitude: "-10.179061", longitude: "-48.327575", sexo: 1, telefone: "323123", cidade_id: 92, ocupacao_id: 2},
     {nome: "Paciente 6", nome_mae: "teste", idade: 12, peso: "21.0", endereco: "Q. 704 Sul Alameda 3 - Plano Diretor Sul, Palmas - TO, Brasil", latitude: "-10.2244851", longitude: "-48.32698800000003", sexo: 1, telefone: "dasds", cidade_id: 92, ocupacao_id: 1},
     {nome: "Paciente 4", nome_mae: "teste", idade: 34, peso: "12.0", endereco: "teste", latitude: "-11.729258", longitude: "  -49.086355", sexo: 1, telefone: "23123", cidade_id: 92, ocupacao_id: 3},
     {nome: "Paciente 5", nome_mae: "teste", idade: 12, peso: "32.0", endereco: "Q. 804 Sul Alameda 2, 60 - Plano Diretor Sul, Palmas - TO, Brasil", latitude: "-10.2344724", longitude: "-48.32916879999999", sexo: 1, telefone: "123", cidade_id: 92, ocupacao_id: 1}
 ])
Notificacao.create!([
  {numero: "123", data: "2018-01-23", grau_incapacidade: "grau_0", modo_entrada: "outra_unidade", modo_deteccao: "encaminhamento", observacoes: "teste", baciloscopia: "positivo", data_inicio: "2018-01-24", esquema_terapeutico: "pb_adulto", paciente_id: 1}
])
AvaliacaoNotificacao.create!([
   {classificacao_operacional: "multibacilar", inicio_pqt: "2018-01-23", alta_pqt: "2018-01-27", profissao: "teste", unidade_saude: "teste", atividades_realizadas_ubs: false, grupo_autocuidado: false, encaminhamentos: "teste", imobilizacoes: "teste", adaptacoes: "teste", observacoes: "teste", notificacao_id: 1, atividades_orientadas: nil}
])
ClassificacaoGrau.create!([
  {avaliacao_notificacao_id: 1, data: "2018-01-23", olho_direito: 1, olho_esquerdo: 2, mao_direita: 3, mao_esqueda: 4, pe_direito: 5, pe_esquerdo: 6, maior_grau: 7, escore_omp: 8}
])

DadosClinico.create!([
  {lesoes_cultaneas: 1, forma_clinica: "i", classificacao_operacional: "multibacilar", nervos_afetados: 1, notificacao_id: 1}
])
EpisodioReacional.create!([
  {notificacao_id: 1, tipo: "tipo_1", numero_episodios: 2, conduta_mendicamentosa: "teste", data_inicio: "2018-01-23", data_termino: "2018-01-31"}
])
EsquemaSubstitutivo.create!([
  {miligramas: "100.0", medicamento_id: 1, notificacao_id: 1}
])



NotificacaoContato.create!([
  {nome: "Contato 1", tipo_contato: "domiciliar", suspeito: false, confirmado: false, notificacao_id: 1, bcg_primeira: "2018-01-23", bcg_segunda: "2018-01-25", bcg_cicatriz: true}
])
ContatoAvaliacao.create!([
   {data: "2018-01-25", suspeito: true, confirmado: false, notificacao_contato_id: 1}
])




AvaliacaoNeurologica.create!([
   {queixa_id: 1, avaliacao_notificacao_id: 1, direito: "10", esquerdo: "10", data: "2018-01-23"}
])

AvaliacaoSensitiva.create!([
   {avaliacao_notificacao_id: 1, data: "2018-01-25", dedao_direito: 5, indicador_d_ponta: 4, indicador_d: 3, mindinho_d_ponta: 1, mindinho_d: 1, mao_direita: 4, mao_d_costa: 6, dedao_esquerdo: 2, indicador_e_ponta: 5, indicador_e: 4, mindinho_e_ponta: 4, mindinho_e: 5, mao_esquerda: 3, mao_e_costa: 6, pe_direito: 1, pe_d_1_ponta: 6, pe_d_3_ponta: 4, pe_d_5_ponta: 2, pe_d_1: 3, pe_d_3: 2, pe_d_5: 5, pe_d_e1: 3, pe_d_calcanhar: 1, pe_esquerdo: 5, pe_e_1_ponta: 5, pe_e_3_ponta: 5, pe_e_5_ponta: 6, pe_e_1: 4, pe_e_3: 6, pe_e_5: 3, pe_e_e1: 5, pe_e_e2: 1, pe_e_calcanhar: 2, pe_d_e2: 4}
])
