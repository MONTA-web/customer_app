class CustomersController < ApplicationController
  before_action :authenticate_user!,only:[:index,:new,:create]

  def index
   @customers = current_user.customers.order("created_at DESC")
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
        redirect_to root_path
    else
       render action: :new
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:prefecture_id,:city,:house_number,:building_name,:phone,:product_name,:amount_money,:visit_date,:purchase_date,:remark_column).merge(user_id: current_user.id)
  end

end