class OrdersController < ApplicationController
  def index
    @orders = status_param.present? ? Order.with_status(status_param) : Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders, each_serializer: OrderSerializer }
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to action: :index }
        format.json { render json: @order, serializer: OrderSerializer, status: :created }
      else
        @errors = @order.errors
        format.html { render action: 'new', errors: @order.errors }
        format.json { render json: @errors }
      end
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to action: :index }
        format.json { render json: @order, serializer: OrderSerializer, status: :success }
      else
        @errors = @order.errors
        format.html { render action: 'edit', errors: @order.errors }
        format.json { render json: @errors }
      end
    end
  end

  private

  def status_param
    params[:status]
  end

  def order_params
    params.require(:order)
          .permit(:id, :first_name, :last_name, :phone_number,
                  :products, :status, :details)
  end
end
