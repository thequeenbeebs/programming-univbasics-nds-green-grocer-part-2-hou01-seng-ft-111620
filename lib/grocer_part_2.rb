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
    if cart_item[:clearance] == true
      cart_item[:price] = cart_item[:price] - (cart_item[:price] * 0.2)
    end
  end
end

def checkout(cart, coupons)
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  cart.each do |cart_item|
    item_total = cart_item[:price] * cart_item[:count]
    total += item_total
  end
  if total > 100
    total = total - (total * 0.1)
  end
  total
end
