class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    @breadcrumb = "BRAND "
  end

  def new
    @breadcrumb = "CREATE NEW BRAND"
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to new
    else
      render "new"
    end
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      redirect_to new
    else
      render "edit"
    end
  end

  def edit
    @breadcrumb = "UPDATE BRAND"
    @brand = Brand.find(params[:id])
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy()
    redirect_to new
  end

  def brand_params
    params.require(:brand).permit(:name, :description, :image)
  end
end
