class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
 
  def create
    charge = perform_stripe_charge
    order  = create_order(charge)
 
    if order.valid?
      empty_cart!
      UserMailer.confirmation_mailer(order, current_user).deliver
      redirect_to(order, notice: "order was successfully placed.")
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end
 
  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private
 
  def empty_cart!
    # empty hash means no products in cart :slightly_smiling_face:
    update_cart({})
  end
 
  def perform_stripe_charge
    description = "<%= current_user%>'s jungle order"
    currency = "cad"
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: description,
      currency:    currency
    )
  end
 
  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )
    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end
end