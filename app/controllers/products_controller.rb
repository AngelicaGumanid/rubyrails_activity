class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index # Responsible for displaying everything in the list product, also uses to render the modal form
    @products = Product.all
    @product = Product.new # For modal
  end

  # Removed since I called the new in the modal already
  # def new
  #   @product = Product.new
  # end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product was successfully created.'
      respond_to do |format|
        format.html { redirect_to products_path }
        format.js
      end
      # redirect_to products_path
    else
      flash.now[:alert] = 'Product create failed'
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.js   # This will render create.js.erb with errors
      end
      # render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to products_path
    else
      flash.now[:alert] = 'Product create failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Product deleted successfully'
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :content, :quantity, :price, :available, :released_at, :discount, :image)
  end

end
