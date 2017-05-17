class DesignersController < ApplicationController
  def index
    @designers = Designer.page(params[:page]).per(10)
  end

  def show
    @designer = Designer.find(params[:id])
  end
end
