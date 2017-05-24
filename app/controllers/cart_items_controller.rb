class CartItemsController < ApplicationController

  # 修改購物車購買數量
  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @cart_item.quantity = params[:quantity]
    @cart_item.save

    redirect_to :back
  end

  # 刪除購物車內單一商品
  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy

    redirect_to :back
  end

end
