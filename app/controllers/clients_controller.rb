class ClientsController < ApplicationController
  def index
    @clients = Client.page(params[:page]).per(10)
  end

  def show
    @client = Client.find(params[:id])
  end
end
