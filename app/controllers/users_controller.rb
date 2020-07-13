#Classe que controla as açoes da Users
class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  # GET /users/1
  def show
  end

  #Método que retorna a página home do sistema
  def home
    render layout: "clean"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def alterar_senha
    user = User.find(params[:usuario])
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    if user.save
      redirect_to users_path, notice: 'Senha alterada com sucesso'
    else
      redirect_to users_path, alert: user.errors.full_messages.to_sentence
    end
  end


  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    #binding.pry
    if @user.update(user_params)
      redirect_to @user, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Usuário excluído com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:nome, :cpf, :email, :cidade_id, :role, :password, :password_confirmation,:ativo)
    end
end
