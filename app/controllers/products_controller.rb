class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    if current_user&.user_role == 'vendor'
      @product = current_user.products.build(product_params)
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
    else
      flash[:alert] = "You have not authority to create Product"
      redirect_to products_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, category_ids: [])
  end
end
