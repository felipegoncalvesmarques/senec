# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-17 19:11:95
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-17 19:11:33

class ActivitiesController < ApplicationController
  before_action :authenticate_organizer!, only: [:new, :create, :edit, :update]

  def new
  end
  def create
    params = activities_param
    params[:criado_por] = current_organizer
    @activity = Activity.create(params)
    if @activity.save
      redirect_to '/organizers/index'
    else
      render 'new'
    end
  end
  def show
    @activity = Activity.find(params[:id])
  end
  def edit
    @activity = Activity.find(params[:id])
  end
  def update
    @activity = Activity.find(params[:id])
    params = activities_param
    params[:atualizado_por] = current_organizer
    if @activity.update(params)
      redirect_to '/organizers/index'
    else
      render 'edit'
    end
  end
  def destroy
    @activity = Activity.find(params[:id])
    @activity.update(esta_ativo: false, atualizado_por: current_organizer)
    redirect_to '/organizers/index'
  end
  private
    def activities_param
      params.require(:activity).permit(:titulo,
                                    :descricao,
                                    :local,
                                    :data_horario,
                                    :numero_de_vagas,
                                    :data_limite_de_inscricao)
    end
end
