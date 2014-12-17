class OrderLine < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :qty, :sub_total

  belongs_to :product
  belongs_to :order

  def self.save_order_lines(ols, od)

    ols.each do |ol|
      p = Product.find(ol[:product_id])
      l = self.create(order_id: od.id, product_id: p.id, qty: ol['qty'], sub_total: (p.price * ol['qty'].to_i))
      
    end
  end
end
