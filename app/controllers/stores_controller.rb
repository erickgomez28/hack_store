class StoresController < ApplicationController

  def index
    @stores = Store.all
    respond_to do |format|
      format.html# index.html.erb
      format.json { render json: @stores}
    end
  end

  def show
    @store = Store.find_by(id: params[:id])
    response_format @store      
  end

  def new 
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      respond_to do |format|
        format.html { redirect_to stores_path, notice: 'person was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def edit
    @store = Store.find_by(id: params[:id])
    response_format @store
  end

  def update
    @store = Store.find_by(id: params[:id])
    if @store.update(store_params)
      respond_to do |format|
        format.html { redirect_to stores_path, notice: 'person was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def destroy 
    @store = Store.find_by(id: params[:id])
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_path, notice: 'person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def store_params
    params.require(:store).permit(:name, :kind)
  end

end
