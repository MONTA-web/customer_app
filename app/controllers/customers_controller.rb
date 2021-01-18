class CustomersController < ApplicationController
  before_action :authenticate_user!,only:[:index,:new,:create,:show,:edit,:update]
  before_action :redirect_to_home,only:[:show,:edit,:update]

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

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:prefecture_id,:city,:house_number,:building_name,:phone,:product_name,:amount_money,:visit_date,:purchase_date,:remark_column).merge(user_id: current_user.id)
  end

  def redirect_to_home
    @customer = Customer.find(params[:id])
    unless @customer.user_id == current_user.id
      redirect_to root_path
    end
  end

end