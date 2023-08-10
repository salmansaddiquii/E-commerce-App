class CartsController < ApplicationController

  def show
    @cart = current_user&.cart
  end

  def cart_item
    product = Product.find(params[:product_id])
    current_user.create_cart unless current_user.cart

    cart_item = current_user&.cart&.cart_items.find_by(product: product)
    
    if cart_item
      cart_item.update(quantity: cart_item.quantity + 1)
    else
      current_user.cart.cart_items.create(product: product, quantity: 1)
    end

    redirect_to authenticated_root_path, notice: 'Product added to cart!'
  end
end
  