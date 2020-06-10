class CombineItemsInCart < ActiveRecord::Migration[6.0]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |pid, q|
        if q > 1
          cart.line_items.where(product_id: pid).delete_all

          item = cart.line_items.build(product_id: pid)
          item.quantity = q
          item.save!
        end
      end
    end
  end

  def down
    LineItem.where('quantity>1').each do |l|
      LineItem.create(
        cart_id: line_item.cart_id,
        product_id: line_item.product_id,
        quantity: 1
      )
    end
  end

end
