class LojasController < ApplicationController
  
  before_action :authenticate_usuario!
  #before_action :lojista_at_least, :except => :show
  
  autocomplete :loja, :nome, :extra_data => [:endereco, :cidade, :estado]
  
  # GET /lojas(.:format)
  def index
    if current_usuario.admin?
      @lojas = Loja.all
    else
      @lojas = current_usuario.lojas
    end
  end
  
  # GET /lojas/new(.:format)
  def new
    @loja = Loja.new
    @loja.locais.build
    @loja.horarios.build
  end

  # POST /lojas(.:format)
  def create
    if current_usuario.admin?
      @loja = Loja.new(loja_params)
    else
      @loja = current_usuario.lojas.build(loja_params)
    end
    
    if @loja.save
      redirect_to lojas_path
    else
      render 'new'
    end
  end
  
  # GET /lojas/:id(.:format)
  def show
    @loja = Loja.find_by_uuid!(params[:id])
  end

  # GET /lojas/:id/edit(.:format)
  def edit
    if current_usuario.admin?
      @loja = Loja.find_by_uuid!(params[:id])
    else
      @loja = current_usuario.lojas.find_by_uuid!(params[:id])
    end
    
    if @loja.locais.empty?
      @loja.locais.build
    end
    
    if @loja.horarios.empty?
      @loja.horarios.build
    end
  end

  # PATCH/PUT /lojas/:id(.:format)
  def update
    if current_usuario.admin?
      @loja = Loja.find_by_uuid!(params[:id])
    else
      @loja = current_usuario.lojas.find_by_uuid!(params[:id])
    end

    if @loja.update_attributes(loja_params)
      redirect_to lojas_path
    else
      render 'edit'
    end
  end
  
  # DELETE /lojas/:id(.:format)
  def destroy
    if current_usuario.admin?
      @loja = Loja.find_by_uuid!(params[:id])
    else
      @loja = current_usuario.lojas.find_by_uuid!(params[:id])
    end
    
    @loja.destroy

    redirect_to lojas_path
  end
  
  private
  
  def loja_params
    params.require(:loja).permit(:nome, :telefone, :email, :website, :facebook, :logo, :fundo, :descricao, 
              esporte_ids: [],
              locais_attributes: [:id, :latitude, :longitude, :logradouro, :numero, :complemento, :bairro, :cidade, :estado, :cep, :pais], 
              horarios_attributes: [:id, :dias, :periodo, :inicio, :fim]
          )
  end
  
end
