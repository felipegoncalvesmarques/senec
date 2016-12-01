# @Author: Felipe Gonçalves Marques
# @Date:   2016-11-12 09:11:03
# @Email:  marques.goncalves.felipe@gmail.com
# @Last modified by:   Felipe Gonçalves Marques
# @Last modified time: 2016-11-17 19:11:26

Rails.application.routes.draw do

  get 'welcome/index'
  get 'participants/index'
  get 'organizers/index'
  get 'partners/index'
  root  'welcome#index' 
  devise_for :partners, :controllers => {registrations: 'partners/registrations'}
  devise_for :organizers, :controllers => {registrations: 'organizers/registrations'}
  devise_for :participants, :controllers => {registrations: 'participants/registrations'}
  resources :companies do
    resources :speakers
  end
  resources :activities do 
    resources :presences
    resources :feedbacks
    resources :activity_speakers
    resources :subscriptions, only: [:create, :destroy, :update]
  end
end
