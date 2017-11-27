class CartController < ApplicationController


  before_action :authenticate_user!, expcept: [:add_to_cart, :view_order]

  def add_to_cart
    #lets add a message that will not allow our user to add '0' quantity

    if params[:quantity].to_i == 0
      flash[:notice] = "Please enter a valid quantity to add to cart!"
      redirect_back(fallback_location: root_path) 

      #if user provides valid information we next check to see if the item has already been
      #added to prevent duplicates
    else

#call current_order      
    @order = current_order

       line_item = @order.line_items.where(product_id: params[:product_id].to_i).first
        #if line_item is not found, we create it.
        if line_item.blank?
          line_item = @order.line_items.new(product_id: params[:product_id], quantity: params[:quantity])

          @order.save
          session[:order_id] = @order.id

          line_item.update(line_item_total: (line_item.quantity * line_item.product.price))

        else
        #if found, we update it with the additional quantity
          new_quantity = line_item.quantity + params[:quantity].to_i
          line_item.update(quantity: new_quantity)
          line_item.update(line_item_total: (line_item.quantity * line_item.product.price))    

        end 
      redirect_back(fallback_location: root_path)
    end
  end

  def checkout

    line_items = current_order.line_items

    if line_items.length != 0 

      current_order.update(user_id: current_user.id, subtotal: 0)

      @order = current_order

        line_items.each do |item|
          item.product.update(quantity: (item.product.quantity - item.quantity))
          @order.order_items[item.product_id] = item.quantity
          @order.subtotal += item.line_item_total
        end
      @order.save

      @order.update(sales_tax: (@order.subtotal * 0.08))
      @order.update(grand_total: (@order.sales_tax + @order.subtotal))

      @order.line_items.destroy_all

      session[:order_id] = nil
    end
  end


  def delete_line_item
    line_item = current_order.line_items.find_by(product_id: params[:product_id].to_i)
    line_item.destroy

    redirect_back(fallback_location: view_order)
       
  end

  def edit_line_item

    line_item = current_order.line_items.find_by(product_id: params[:product_id].to_i)
    line_item.update(quantity: params[:quantity].to_i)
    line_item.update(line_item_total: line_item.quantity * line_item.product.price)

    redirect_back(fallback_location: view_order)
  end

  def order_complete
    @order = Order.find(params[:order_id])
    @amount = (@order.grand_total.to_f.round(2) * 100).to_i

    @order.line_items.destroy_all
    session[:order_id] = nil


    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Cynzia\'s Customer',
      :currency => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path

  end

  def view_order
    @line_items = current_order.line_items

    @cart_total = 0

    @line_items.each do |item|
      @cart_total += item.line_item_total
    end
    
  end

end




