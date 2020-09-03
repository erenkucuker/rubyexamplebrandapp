class ProductsController < ApplicationController
  def index
    @products = Product.where(params[:brand_id])
  end

  def indexall
    @products = Product.all
    @breadcrumb = "PRODUCTS"
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to new
    else
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to new
    else
      render "edit"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy()
    redirect_to new
  end

  def product_params
    params.require(:product).permit(:name, :description, :brand_id)
  end
end
