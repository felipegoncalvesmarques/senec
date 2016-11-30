# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-16 18:11:44
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-17 19:11:26

class SpeakersController < ApplicationController
  before_action :authenticate_organizer!, only: [:new, :create, :edit, :update]

  def new
    @company = Company.find(params[:company_id])
  end

  def create
    @company = Company.find(params[:company_id])
    params = speaker_params
    params[:criado_por] = current_organizer
    @speaker = @company.speakers.create(params)
    if @speaker.save
      redirect_to '/organizers/index'
    else
      render 'new'
    end
  end
  def show
    @speaker = Speaker.find(params[:id])
  end
  def edit
    @company = Company.find(params[:company_id])
    @speaker = Speaker.find(params[:id])
  end
  def update
    @speaker = Speaker.find(params[:id])
    params = speaker_params
    params[:atualizado_por] = current_organizer
    if @speaker.update(params)
      redirect_to '/organizers/index'
    else
      render 'edit'
    end
  end
  def destroy
    @speaker = Speaker.find(params[:id])
    params = {esta_ativo: false, atualizado_por: current_organizer}
    if @speaker.update(params)
      redirect_to '/organizers/index'
    else
      render 'edit'
    end
  end
  private
    def speaker_params
      params.require(:speaker).permit(:nome, :descricao, :telefone)
    end
end
