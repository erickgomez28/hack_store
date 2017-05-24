class StoresController < ApplicationController

  def index
    @stores = Store.all
    respond_to do |format|
      format.html# index.html.erb
      format.json { render json: @stores}
    end
  end

  def new 
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      response_format @store
    end
  end

  def edit
    @store = Store.find_by(id: params[:id])
    response_format @store
  end

  def destroy 
    @store = Store.find_by(id: params[:id])
    @store.destroy
  end

  def show
    @store = Store.find_by(id: params[:id])
    response_format @store      
  end

  private

  def store_params
    params.require(:store).permit(:name, :kind)
  end

end
