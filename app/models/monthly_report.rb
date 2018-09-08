# == Schema Information
#
# Table name: monthly_reports
#
#  id                       :integer          not null, primary key
#  nome_grupo               :string
#  coordenador              :string
#  monitor                  :string
#  lider                    :string
#  data_reuniao             :date
#  inicio                   :time
#  termino                  :time
#  local                    :string
#  temas                    :text
#  atividades_desenvolvidas :text
#  data_proximo             :datetime
#  intercorrencia           :boolean
#  outros_agravos           :integer
#  agravo_diabetes          :integer
#  agravo_hipertensao       :integer
#  agravo_avc               :integer
#  analfabetos              :integer
#  qtd_psicologo            :integer
#  qtd_assistente_social    :integer
#  oficina_sapataria        :integer
#  qtd_hanseniase           :integer
#  qtd_sem_hanseniase       :integer
#  qtd_profissionais        :integer
#  cidade_id                :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_monthly_reports_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class MonthlyReport < ApplicationRecord
  belongs_to :cidade
end
