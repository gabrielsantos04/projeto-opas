# == Schema Information
#
# Table name: dant_faixa_etaria
#
#  id                           :integer          not null, primary key
#  hipertenso_m_1               :integer
#  hipertenso_m_1_4             :integer
#  hipertenso_m_5_9             :integer
#  hipertenso_m_10_14           :integer
#  hipertenso_m_15_19           :integer
#  hipertenso_m_20_29           :integer
#  hipertenso_m_30_39           :integer
#  hipertenso_m_40_49           :integer
#  hipertenso_m_50_59           :integer
#  hipertenso_m_60_69           :integer
#  hipertenso_m_70_79           :integer
#  hipertenso_m_80              :integer
#  hipertenso_f_1               :integer
#  hipertenso_f_1_4             :integer
#  hipertenso_f_5_9             :integer
#  hipertenso_f_10_14           :integer
#  hipertenso_f_15_19           :integer
#  hipertenso_f_20_29           :integer
#  hipertenso_f_30_39           :integer
#  hipertenso_f_40_49           :integer
#  hipertenso_f_50_59           :integer
#  hipertenso_f_60_69           :integer
#  hipertenso_f_70_79           :integer
#  hipertenso_f_80              :integer
#  diabetico_m_1                :integer
#  diabetico_m_1_4              :integer
#  diabetico_m_5_9              :integer
#  diabetico_m_10_14            :integer
#  diabetico_m_15_19            :integer
#  diabetico_m_20_29            :integer
#  diabetico_m_30_39            :integer
#  diabetico_m_40_49            :integer
#  diabetico_m_50_59            :integer
#  diabetico_m_60_69            :integer
#  diabetico_m_70_79            :integer
#  diabetico_m_90               :integer
#  diabetico_f_1                :integer
#  diabetico_f_1_4              :integer
#  diabetico_f_5_9              :integer
#  diabetico_f_10_14            :integer
#  diabetico_f_15_19            :integer
#  diabetico_f_20_29            :integer
#  diabetico_f_30_39            :integer
#  diabetico_f_40_49            :integer
#  diabetico_f_50_59            :integer
#  diabetico_f_60_69            :integer
#  diabetico_f_70_79            :integer
#  diabetico_f_80               :integer
#  diabetico_hipertenso_m_1     :integer
#  diabetico_hipertenso_m_1_4   :integer
#  diabetico_hipertenso_m_5_9   :integer
#  diabetico_hipertenso_m_10_14 :integer
#  diabetico_hipertenso_m_15_19 :integer
#  diabetico_hipertenso_m_20_29 :integer
#  diabetico_hipertenso_m_30_39 :integer
#  diabetico_hipertenso_m_40_49 :integer
#  diabetico_hipertenso_m_50_59 :integer
#  diabetico_hipertenso_m_60_69 :integer
#  diabetico_hipertenso_m_70_79 :integer
#  diabetico_hipertenso_m_80    :integer
#  diabetico_hipertenso_f_1     :integer
#  diabetico_hipertenso_f_1_4   :integer
#  diabetico_hipertenso_f_5_9   :integer
#  diabetico_hipertenso_f_10_14 :integer
#  diabetico_hipertenso_f_15_19 :integer
#  diabetico_hipertenso_f_20_29 :integer
#  diabetico_hipertenso_f_30_39 :integer
#  diabetico_hipertenso_f_40_49 :integer
#  diabetico_hipertenso_f_50_59 :integer
#  diabetico_hipertenso_f_60_69 :integer
#  diabetico_hipertenso_f_70_79 :integer
#  diabetico_hipertenso_f_80    :integer
#  obeso_m_1                    :integer
#  obeso_m_1_4                  :integer
#  obeso_m_5_9                  :integer
#  obeso_m_10_14                :integer
#  obeso_m_15_19                :integer
#  obeso_m_20_29                :integer
#  obeso_m_30_39                :integer
#  obeso_m_40_49                :integer
#  obeso_m_50_59                :integer
#  obeso_m_60_69                :integer
#  obeso_m_70_79                :integer
#  obeso_m_80                   :integer
#  obeso_f_1                    :integer
#  obeso_f_1_4                  :integer
#  obeso_f_5_9                  :integer
#  obeso_f_10_14                :integer
#  obeso_f_15_19                :integer
#  obeso_f_20_29                :integer
#  obeso_f_30_39                :integer
#  obeso_f_40_49                :integer
#  obeso_f_50_59                :integer
#  obeso_f_60_69                :integer
#  obeso_f_70_79                :integer
#  obeso_f_80                   :integer
#  tabagismo_m_1_8              :integer
#  tabagismo_m_9_11             :integer
#  tabagismo_m_12_17            :integer
#  tabagismo_m_18_24            :integer
#  tabagismo_m_25_34            :integer
#  tabagismo_m_35_44            :integer
#  tabagismo_m_45_54            :integer
#  tabagismo_m_55_64            :integer
#  tabagismo_m_65               :integer
#  tabagismo_f_1_8              :integer
#  tabagismo_f_9_11             :integer
#  tabagismo_f_12_17            :integer
#  tabagismo_f_18_24            :integer
#  tabagismo_f_25_34            :integer
#  tabagismo_f_35_44            :integer
#  tabagismo_f_45_54            :integer
#  tabagismo_f_55_64            :integer
#  tabagismo_f_65               :integer
#  etilismo_m_1_8               :integer
#  etilismo_m_9_11              :integer
#  etilismo_m_12_17             :integer
#  etilismo_m_18_24             :integer
#  etilismo_m_25_34             :integer
#  etilismo_m_35_44             :integer
#  etilismo_m_45_54             :integer
#  etilismo_m_55_64             :integer
#  etilismo_m_65                :integer
#  etilismo_f_1_8               :integer
#  etilismo_f_9_11              :integer
#  etilismo_f_12_17             :integer
#  etilismo_f_18_24             :integer
#  etilismo_f_25_34             :integer
#  etilismo_f_35_44             :integer
#  etilismo_f_45_54             :integer
#  etilismo_f_55_64             :integer
#  etilismo_f_65                :integer
#  dant_request_id              :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_dant_faixa_etaria_on_dant_request_id  (dant_request_id)
#
# Foreign Keys
#
#  fk_rails_...  (dant_request_id => dant_requests.id)
#

require 'test_helper'

class DantFaixaEtariumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
