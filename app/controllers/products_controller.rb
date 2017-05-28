class ProductsController < ApplicationController
  def index
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
    @product.category_id = 1
    
    if @product.save
       redirect_to @store
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
    @product.quantity -= 1
    if @product.update(product_params)
      redirect_to @store
    elsif 
      render :edit
    end
  end

  def destroy
    @store = Store.find_by(id: params[:store_id])
    @product = @store.products.find_by(id: params[:id])
    if @product.destroy
      redirect_to @store
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :size,:color, :model)
  end
end
