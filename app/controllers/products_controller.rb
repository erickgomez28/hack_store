class ProductsController < ApplicationController
  def index
  	@store = Store.find_by(id: params[:store_id])
  	@products = @store.products
  	respond_to do |format|
      format.html 
      format.json { head :no_content }
  	end	
  end

  def show
  	@store = Store.find_by(id: params[:store_id])
  	@product = @store.products.find_by(id: params[:id])
    respond_to do |format|
      format.html 
      format.json { head :no_content }
    end 
  end

  def new
    @store = Store.find_by(id: params[:store_id])
    @product = @store.products.build
  end

  def create
    @store = Store.find_by(id: params[:store_id])
    @product = @store.products.build(product_params)

    if @product.save
       redirect_to @store
      # respond_to do |format|
      #   format.html { redirect_to @store, notice: 'product was successfully destroyed.' }
      # end
    elsif 
      render :new
    end
      
  end

  def edit
    @store = Store.find_by(id: params[:store_id])
    @product = @store.products.find_by(id: params[:id])
  end

  def update
    @store = Store.find_by(id: params[:store_id])
    @product = @store.products.find_by(id: params[:id])
    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to @store, notice: 'product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    @store = Store.find_by(id: params[:store_id])
    @product = @store.products.find_by(id: params[:id])
    @product.destroy
    # if @product.destroy
    #   format.html { redirect_to store_product_path(@store), notice: 'product was successfully destroyed.' }
    # end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :size,:color, :model, :category)
  end
end
