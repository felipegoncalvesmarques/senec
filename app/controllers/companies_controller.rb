# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-12 23:11:29
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-16 19:11:34

class CompaniesController < ApplicationController
  before_action :authenticate_organizer!, only: [:new, :create, :edit, :update]

  def index
    @companies = Company.where(esta_ativo: true)
  end
  def new
    @company = Company.new
  end

  def create
    params = company_params
    params[:criado_por] = current_organizer
    @company = Company.create(params)
    if @company.save
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    params = company_params
    params[:atualizado_por] = current_organizer

    if @company.update(params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.update(esta_ativo: false)
    redirect_to companies_path
  end
  private
    def company_params
      params.require(:company).permit(:nome, :descricao, :endereco, :logo, :telefone)
    end
end
