require 'test_helper'

class EpisodioReacionalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @episodio_reacional = episodio_reacionals(:one)
  end

  test "should get index" do
    get episodio_reacionals_url
    assert_response :success
  end

  test "should get new" do
    get new_episodio_reacional_url
    assert_response :success
  end

  test "should create episodio_reacional" do
    assert_difference('EpisodioReacional.count') do
      post episodio_reacionals_url, params: { episodio_reacional: { conduta_mendicamentosa: @episodio_reacional.conduta_mendicamentosa, data_inicio: @episodio_reacional.data_inicio, data_termino: @episodio_reacional.data_termino, notificacao_id: @episodio_reacional.notificacao_id, numero_episodios: @episodio_reacional.numero_episodios, tipo: @episodio_reacional.tipo } }
    end

    assert_redirected_to episodio_reacional_url(EpisodioReacional.last)
  end

  test "should show episodio_reacional" do
    get episodio_reacional_url(@episodio_reacional)
    assert_response :success
  end

  test "should get edit" do
    get edit_episodio_reacional_url(@episodio_reacional)
    assert_response :success
  end

  test "should update episodio_reacional" do
    patch episodio_reacional_url(@episodio_reacional), params: { episodio_reacional: { conduta_mendicamentosa: @episodio_reacional.conduta_mendicamentosa, data_inicio: @episodio_reacional.data_inicio, data_termino: @episodio_reacional.data_termino, notificacao_id: @episodio_reacional.notificacao_id, numero_episodios: @episodio_reacional.numero_episodios, tipo: @episodio_reacional.tipo } }
    assert_redirected_to episodio_reacional_url(@episodio_reacional)
  end

  test "should destroy episodio_reacional" do
    assert_difference('EpisodioReacional.count', -1) do
      delete episodio_reacional_url(@episodio_reacional)
    end

    assert_redirected_to episodio_reacionals_url
  end
end
