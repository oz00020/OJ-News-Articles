

Rails.application.routes.draw do

  get 'page1', to: 'pages#page1'
  get 'page2', to: 'pages#page2'
  get 'page3', to: 'pages#page3'
  get 'page4', to: 'pages#page4'
  get 'page5', to: 'pages#page5'
  get 'rankingpage', to: 'pages#rankingpage'

  # declares all index, show , new, edit and destroy actions
  resources:pages
  root 'pages#index'
end