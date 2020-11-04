require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  cart.each do |cart_item|
    coupons.each do |coupon|
      if cart_item[:item] == coupon[:item]
        cart_item[:count] -= coupon[:num]
        discount = {
          :item => "#{coupon[:item]} W/COUPON",
          :price => coupon[:cost] / coupon[:num],
          :clearance => cart_item[:clearance],
          :count => coupon[:num]
        }
        cart.push(discount)
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |cart_item|
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
