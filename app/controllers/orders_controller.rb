class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json

  before_filter :confirm_logged_in
  def index
    @orders = Order.shopify(sid).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def add_to_cart
    ols = params[:ols] || [] 
    ols << params[:ol]
    @ols = ols
    if !ols[0]['order_id']
      redirect_to action: 'new', :ols => ols
    else
        order = ols[0]["order_id"]

        edit(order || params[:id])
       render 'edit'
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit(order_id='')
    @order = Order.find(params[:id] || order_id)
   
    @ols = Array.new(@order.order_lines.count, Hash.new) 
    i=0
    @order.order_lines.each do |e|  

      @ols[i] = {"product_id" => e.product_id, "qty" => e.qty, "order_id" => @order.id, "ol_id" => e.id}
      i = i + 1
    end 
  
  end

  def del_order_line
    if params["order_line_id"] == ""
        @ols = params[:ols]
        @ols -= [{"product_id" => params['product_id'], "qty" => params['qty']}]

    else
      ol = OrderLine.find(params["order_line_id"])
      
      ol.destroy
    end
      order = params[:id]
      edit(order)
      render 'edit'
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @ols = []
    @order.shop_id = sid
    respond_to do |format|
      if @order.save
        OrderLine.save_order_lines(params[:ols], @order)
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
        
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        @order.order_lines.each { |e| e.destroy  }
        OrderLine.save_order_lines(params[:ols], @order)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  
  
end
