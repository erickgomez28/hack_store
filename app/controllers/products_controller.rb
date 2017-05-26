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
    @categories = Category.all.collect{|c| [c.name, c.id] }
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
    @store = Store.where(@stores.where(statu: 0).first)
    @product = @store.products.find_by(id: params[:id])
    @product.quantity -= 1
    @product.update(product_params)
  end

  def destroy
    @store = Store.find_by(id: params[:store_id])
    @product = @store.products.find_by(id: params[:id])
    @product.destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :size,:color, :model, :category)
  end
end
