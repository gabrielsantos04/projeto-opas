# == Schema Information
#
# Table name: imunizacao_solicitacaos
#
#  id                        :integer          not null, primary key
#  nome_paciente             :string
#  data_nascimento           :date
#  sexo                      :string
#  nome_mae                  :string
#  endereco                  :text
#  bairro                    :string
#  municipio_id              :integer
#  motivo_solicitacao        :text
#  nome_requisitante         :string
#  tipo_requisitante         :string
#  crm_coren                 :string
#  telefone_requisitante     :string
#  instituicao_requisitante  :string
#  municipio_requisitante_id :integer
#  anexo                     :text
#  solicitante               :string
#  observacoes               :text
#  data_atendimento          :date
#  municipio_atual_id        :integer
#  status                    :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  telefone_paciente         :string
#  idade                     :integer
#  deferimento               :text
#  anexos                    :json
#  solicitante_tipo          :string
#  solicitante_crm_corem     :string
#  solicitante_telefone      :string
#  solicitante_instituicao   :string
#  solicitante_municipio     :integer
#

require 'test_helper'

class ImunizacaoSolicitacaoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
