# == Schema Information
#
# Table name: dant_requests
#
#  id                                 :integer          not null, primary key
#  qtd_hipertensos                    :integer
#  atendimento_hipertensos            :integer
#  qtd_obitos_hipertensos             :integer
#  qtd_diabeticos                     :integer
#  atendimento_diabeticos             :integer
#  qtd_obitos_diabeticos              :integer
#  qtd_diabeticos_hipertencos         :integer
#  atendimento_diabeticos_hipertensos :integer
#  qtd_tratamento_hemodialise         :integer
#  qtd_nph                            :integer
#  qtd_frascos_nph                    :integer
#  qtd_regular                        :integer
#  qtd_frascos_regular                :integer
#  qtd_analoga                        :integer
#  qtd_frascos_analoga                :integer
#  qtd_tabagista                      :integer
#  qtd_atendimento_tabagista          :integer
#  qtd_etilista                       :integer
#  qtd_atendimento_etilista           :integer
#  qtd_obesos                         :integer
#  qtd_obesidade_1                    :integer
#  qtd_obesidate_2                    :integer
#  qtd_obesidade_3                    :integer
#  mes                                :integer
#  dant_responsavel_program_id        :integer
#  cidade_id                          :integer
#  status                             :string
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  ano                                :integer
#  soma_participacoes                 :integer
#  data_envio                         :datetime
#  qtd_nph_calculada                  :integer
#  qtd_regular_calculada              :integer
#  qtd_analoga_calculada              :integer
#  justificativa                      :text
#
# Indexes
#
#  index_dant_requests_on_cidade_id                    (cidade_id)
#  index_dant_requests_on_dant_responsavel_program_id  (dant_responsavel_program_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (dant_responsavel_program_id => dant_responsavel_programs.id)
#

require 'test_helper'

class DantRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
