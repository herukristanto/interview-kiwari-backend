class ProductsController < ActionController::API
  def index
    @products = Product.all

    render json: {
      code: 200,
      msg: "Success",
      value: @products
    }, status: :ok
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json:{
        code: 200,
        msg: "Success",
        value: @product
      }, status: :ok
    else
      render json:{
        code: 200,
        msg: "error",
        value: @product.error
      }, status: :unprocessable_entity
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json:{
      code: 200,
      msg: "Success",
      value: @product
    }, status: :ok
  end

  def show
    @product = Product.find(params[:id])
      render json:{
      code: 200,
      msg: "Success",
      value: @product
    }, status: :ok
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      render json:{
      code: 200,
      msg: "Success",
      value: @product
      }, status: :ok
    else
      render json:{
      msg: "error",
      value: @product.error
      }, status: :unprocessable_entity
    end
  end

  private
  def product_params
    params.permit(:name, :price, :image)
  end
end
