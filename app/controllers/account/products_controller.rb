class Account::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = current_user.wish_list_items
  end
end
