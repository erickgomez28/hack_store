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
  end

  def edit
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
    end
  end
  private
  def product_params
    params.require(product).permit(:name, :price, :quantity, :size,:color, :model, :store_id, :category_id)
  end
end
