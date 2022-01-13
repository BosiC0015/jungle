class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['admin_username'], password: ENV['admin_password']
  
  def show
    @products = Product.all
    @categories = Category.all
  end

end
